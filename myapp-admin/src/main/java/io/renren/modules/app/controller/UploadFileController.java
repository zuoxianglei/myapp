package io.renren.modules.app.controller;

import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author Administrator
 */
@RestController
@RequestMapping({"/filesystem"})
public class UploadFileController {
    @RequestMapping({"/upload"})
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file)
            throws IOException, MyException {
        if (file == null) {
            throw new RuntimeException("文件不能为空");
        }

        String filename = file.getOriginalFilename();
        if (StringUtils.isEmpty(filename)) {
            throw new RuntimeException("文件不存在");
        }

        String extName = filename.substring(filename.lastIndexOf(".") + 1);
        NameValuePair[] metaList = new NameValuePair[1];
        metaList[0] = new NameValuePair("fileName", filename);

        ClientGlobal.initByProperties("config\\fastdfs-client.properties");
        System.out.println("network_timeout=" + ClientGlobal.g_network_timeout + "ms");
        System.out.println("charset=" + ClientGlobal.g_charset);
        TrackerClient tracker = new TrackerClient();
        TrackerServer trackerServer = tracker.getConnection();

        StorageServer storageServer = null;

        StorageClient storageClient = new StorageClient(trackerServer, storageServer);

        String[] strings = storageClient.upload_file(file.getBytes(), extName, metaList);
        return strings[0] + "/" + strings[1];
    }
}