package io.renren.modules.app.controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * 文件上传控制层
 *
 * @author Administrator
 */
@RestController
@RequestMapping({"app"})
public class UploadController {

    @PostMapping({"file/upload"})
    public String singleFileUpLoad(@RequestParam("myfile") MultipartFile file) {
        if (file.isEmpty()) {
            return "文件为空";
        }

        InputStream inputStream = null;
        OutputStream outputStream = null;
        String fileName = "";
        try {
            String path = "d:/upload/";

            inputStream = file.getInputStream();

            fileName = file.getOriginalFilename();

            File targetFile = new File(path + fileName);

            if (!targetFile.getParentFile().exists()) {
                targetFile.getParentFile().mkdir();
            }

            outputStream = new FileOutputStream(targetFile);

            FileCopyUtils.copy(inputStream, outputStream);

            return "上传成功";
        } catch (IOException e) {
            e.printStackTrace();
            return "上传失败";
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}