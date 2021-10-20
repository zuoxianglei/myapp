package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.ReturnData;
import io.renren.modules.app.entity.NewsThumbEntity;
import io.renren.modules.app.service.NewsThumbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

@RestController
@RequestMapping({"app/newsthumb"})
public class NewsThumbController {

    @Autowired
    private NewsThumbService newsThumbService;

    @RequestMapping({"/list"})
    public ReturnData list(@RequestParam Map<String, Object> params) {
        PageUtils page = this.newsThumbService.queryPage(params);

        return ReturnData.ok().put("page", page);
    }

    @RequestMapping({"/info/{thumbId}"})
    public ReturnData info(@PathVariable("thumbId") Integer thumbId) {
        NewsThumbEntity newsThumb = (NewsThumbEntity) this.newsThumbService.getById(thumbId);

        return ReturnData.ok().put("newsThumb", newsThumb);
    }

    @RequestMapping({"/save"})
    public ReturnData save(@RequestBody NewsThumbEntity newsThumb) {
        this.newsThumbService.save(newsThumb);

        return ReturnData.ok();
    }

    @RequestMapping({"/update"})
    public ReturnData update(@RequestBody NewsThumbEntity newsThumb) {
        this.newsThumbService.updateById(newsThumb);

        return ReturnData.ok();
    }

    @RequestMapping({"/delete"})
    public ReturnData delete(@RequestBody Integer[] thumbIds) {
        this.newsThumbService.removeByIds(Arrays.asList(thumbIds));

        return ReturnData.ok();
    }
}