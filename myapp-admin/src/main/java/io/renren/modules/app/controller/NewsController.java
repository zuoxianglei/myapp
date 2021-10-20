package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.ReturnData;
import io.renren.modules.app.annotation.Login;
import io.renren.modules.app.entity.NewsEntity;
import io.renren.modules.app.entity.NewsThumbEntity;
import io.renren.modules.app.service.NewsService;
import io.renren.modules.app.service.NewsThumbService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping({"app/news"})
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private NewsThumbService thumbService;

    @RequestMapping({"/list"})
    public ReturnData list(@RequestParam Map<String, Object> params) {
        PageUtils page = this.newsService.queryPage(params);
        return ReturnData.ok().put("page", page);
    }

    /**
     * 资讯列表
     *
     * @param params
     * @return
     */
    @RequestMapping({"/api/list"})
    @Login
    public ReturnData listApi(@RequestParam Map<String, Object> params) {
        PageUtils page = this.newsService.queryPageApp(params);
        return ReturnData.ok().put("page", page);
    }

    @RequestMapping({"/info/{newsId}"})
    public ReturnData info(@PathVariable("newsId") Integer newsId) {
        NewsEntity news = (NewsEntity) this.newsService.getById(newsId);
        return ReturnData.ok().put("news", news);
    }

    @RequestMapping({"/save"})
    public ReturnData save(@RequestBody NewsEntity news) {
        this.newsService.save(news);
        List<String> imgList = news.getImgList();
        List<NewsThumbEntity> newsThumbEntities = new ArrayList();
        for (String url : imgList) {
            NewsThumbEntity newsThumbEntity = new NewsThumbEntity();
            newsThumbEntity.setNewsId(news.getNewsId());
            newsThumbEntity.setThumbUrl(url);
            newsThumbEntities.add(newsThumbEntity);
        }
        this.thumbService.saveBatch(newsThumbEntities);
        return ReturnData.ok();
    }

    @RequestMapping({"/update"})
    public ReturnData update(@RequestBody NewsEntity news) {
        this.newsService.updateById(news);
        return ReturnData.ok();
    }

    @RequestMapping({"/delete"})
    @RequiresPermissions({"app:news:delete"})
    public ReturnData delete(@RequestBody Integer[] newsIds) {
        this.newsService.removeByIds(Arrays.asList(newsIds));
        return ReturnData.ok();
    }
}