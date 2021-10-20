package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.ReturnData;
import io.renren.modules.app.annotation.Login;
import io.renren.modules.app.entity.VideoCategoryEntity;
import io.renren.modules.app.service.VideoCategoryService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
@RestController
@RequestMapping({"app/videocategory"})
public class VideoCategoryController {

    @Autowired
    private VideoCategoryService videoCategoryService;


    /**
     * 视频类型列表
     * @param params
     * @return
     */
    @RequestMapping({"/list"})
    @Login
    public ReturnData list(@RequestParam Map<String, Object> params) {
        PageUtils page = this.videoCategoryService.queryPage(params);
        return ReturnData.ok().put("page", page);
    }


    /**
     *
     * @param params
     * @return
     */
    @RequestMapping({"/listAll"})
    public ReturnData listAll(@RequestParam Map<String, Object> params) {
        List list = this.videoCategoryService.list();
        PageUtils page = new PageUtils(list, list.size(), list.size(), 1);
        return ReturnData.ok().put("page", page);
    }


    /**
     *
     * @param categoryId
     * @return
     */
    @RequestMapping({"/info/{categoryId}"})
    @RequiresPermissions({"app:videocategory:info"})
    public ReturnData info(@PathVariable("categoryId") Integer categoryId) {
        VideoCategoryEntity videoCategory = (VideoCategoryEntity) this.videoCategoryService.getById(categoryId);
        return ReturnData.ok().put("videoCategory", videoCategory);
    }


    /**
     *
     * @param videoCategory
     * @return
     */
    @RequestMapping({"/save"})
    @RequiresPermissions({"app:videocategory:save"})
    public ReturnData save(@RequestBody VideoCategoryEntity videoCategory) {
        this.videoCategoryService.save(videoCategory);
        return ReturnData.ok();
    }


    /**
     *
     * @param videoCategory
     * @return
     */
    @RequestMapping({"/update"})
    @RequiresPermissions({"app:videocategory:update"})
    public ReturnData upate(@RequestBody VideoCategoryEntity videoCategory) {
        this.videoCategoryService.updateById(videoCategory);
        return ReturnData.ok();
    }


    /**
     *
     * @param categoryIds
     * @return
     */
    @RequestMapping({"/delete"})
    @RequiresPermissions({"app:videocategory:delete"})
    public ReturnData delete(@RequestBody Integer[] categoryIds) {
        this.videoCategoryService.removeByIds(Arrays.asList(categoryIds));
        return ReturnData.ok();
    }
}