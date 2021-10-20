package io.renren.modules.app.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.ReturnData;
import io.renren.modules.app.annotation.Login;
import io.renren.modules.app.annotation.LoginUser;
import io.renren.modules.app.entity.*;
import io.renren.modules.app.repository.CollectRepository;
import io.renren.modules.app.service.VideoCategoryService;
import io.renren.modules.app.service.VideoListService;
import io.renren.modules.app.service.impl.VideoSocialService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * @author Administrator
 */
@RestController
@RequestMapping({"app/videolist"})
public class VideoListController {

    @Autowired
    private VideoListService videoListService;
    @Autowired
    private CollectRepository collectRepository;
    @Autowired
    private VideoCategoryService videoCategoryService;
    @Autowired
    VideoSocialService videoSocialService;
    @Autowired
    private MongoTemplate mongoTemplate;

    public VideoListController() {
    }

    @RequestMapping({"/list"})
    public ReturnData list(@RequestParam Map<String, Object> params) {
        PageUtils page = this.videoListService.queryPage(params);
        return ReturnData.ok().put("page", page);
    }


    /**
     * 所有类型视频列表
     * @param params
     * @return
     */
    @RequestMapping({"/listAll"})
    public ReturnData listAll(@RequestParam Map<String, Object> params) {
        List<VideoListEntity> list = this.videoListService.list();
        PageUtils page = new PageUtils(list, list.size(), list.size(), 1);
        return ReturnData.ok().put("page", page);
    }

    /**
     * 各类型视频列表
     * @param params
     * @return
     */
    @RequestMapping({"/getListByCategoryId"})
    @Login
    public ReturnData queryPageByCategoryId(@RequestParam Map<String, Object> params) {
        PageUtils page = this.videoListService.queryPageByCategoryId(params);
        return ReturnData.ok().put("page", page);
    }

    /**
     *
     * @param vid
     * @return
     */
    @RequestMapping({"/info/{vid}"})
    @RequiresPermissions({"app:videolist:info"})
    public ReturnData info(@PathVariable("vid") Integer vid) {
        VideoListEntity videoList = this.videoListService.getById(vid);
        List<VideoCategoryEntity> categoryList = this.videoCategoryService.list();
        return ReturnData.ok().put("videoList", videoList).put("categoryList", categoryList);
    }


    /**
     *
     * @param videoList
     * @return
     */
    @RequestMapping({"/save"})
    @RequiresPermissions({"app:videolist:save"})
    public ReturnData save(@RequestBody VideoListEntity videoList) {
        this.videoListService.save(videoList);
        return ReturnData.ok();
    }


    /**
     *
     * @param videoList
     * @return
     */
    @RequestMapping({"/update"})
    @RequiresPermissions({"app:videolist:update"})
    public ReturnData update(@RequestBody VideoListEntity videoList) {
        this.videoListService.updateById(videoList);
        return ReturnData.ok();
    }


    /**
     *
     * @param vids
     * @return
     */
    @RequestMapping({"/delete"})
    @RequiresPermissions({"app:videolist:delete"})
    public ReturnData delete(@RequestBody Integer[] vids) {
        this.videoListService.removeByIds(Arrays.asList(vids));
        return ReturnData.ok();
    }

    /**
     * 我的收藏
     * @param params
     * @param userEntity
     * @return
     */
    @RequestMapping({"/mycollect"})
    @Login
    public ReturnData getMyCollect(@RequestParam Map<String, Object> params, @LoginUser UserEntity userEntity) {
        Query query = Query.query(Criteria.where("uid").is(userEntity.getUserId()));
        List<CollectEntity> collectEntityList = this.mongoTemplate.find(query, CollectEntity.class);
        List<VideoListEntity> videoListEntities = new ArrayList();
        Iterator var6 = collectEntityList.iterator();

        while (var6.hasNext()) {
            CollectEntity collectEntity = (CollectEntity) var6.next();
            int vid = collectEntity.getVid();
            VideoListEntity videoListEntity = (VideoListEntity) this.videoListService.getById(vid);
            videoListEntities.add(videoListEntity);
        }

        return ReturnData.ok().put("list", videoListEntities);
    }


    /**
     * 更新点赞,收藏,评论
     * @param params
     * @param user
     * @return
     */
    @PostMapping({"/updateCount"})
    @Login
    public ReturnData updateCount(@RequestBody Map<String, Object> params, @LoginUser UserEntity user) {
        Integer type = (Integer) params.get("type");
        Integer vid = (Integer) params.get("vid");
        Boolean flag = (Boolean) params.get("flag");
        VideoSocialEntity entity = this.videoSocialService.getVideoSocialByVid(vid);
        switch (type) {
            case 0:
            default:
                break;
            case 1:
                int collect = entity.getCollectnum();
                if (flag) {
                    ++collect;
                    entity.setCollectnum(collect);
                } else if (collect > 0) {
                    --collect;
                    entity.setCollectnum(collect);
                }

                entity.setFlagCollect(flag);
                this.videoSocialService.update(entity, user.getUserId(), flag);
                break;
            case 2:
                int likenum = entity.getLikenum();
                if (flag) {
                    ++likenum;
                    entity.setLikenum(likenum);
                } else if (likenum > 0) {
                    --likenum;
                    entity.setLikenum(likenum);
                }

                entity.setFlagLike(flag);
                this.videoSocialService.update(entity);
        }

        return ReturnData.ok();
    }
}
