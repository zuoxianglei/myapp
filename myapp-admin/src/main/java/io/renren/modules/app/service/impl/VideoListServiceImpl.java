package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.dao.VideoListDao;
import io.renren.modules.app.entity.VideoListEntity;
import io.renren.modules.app.entity.VideoSocialEntity;
import io.renren.modules.app.service.VideoListService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @ClassName VideoListServiceImpl.java
 * @description:
 * @author: zuoxianglei
 * @create: 2021-06-27 19:54
 **/
@Service
public class VideoListServiceImpl extends ServiceImpl<VideoListDao, VideoListEntity> implements VideoListService {

    @Autowired
    VideoSocialService socialService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        //IPage<VideoListEntity> page = this.page(
        //        new Query<VideoListEntity>().getPage(params),
        //        new QueryWrapper<VideoListEntity>()
        //);
        //
        //return new PageUtils(page);


        String author = (String) params.get("author");
        VideoListEntity video = new VideoListEntity();
        if (StringUtils.isNotBlank(author)) {
            video.setAuthor("%" + author + "%");
        }

        long curPage = 1L;
        long limit = 10L;
        if (params.get("page") != null) {
            curPage = Long.parseLong((String) params.get("page"));
        }

        if (params.get("limit") != null) {
            limit = Long.parseLong((String) params.get("limit"));
        }

        Page<VideoListEntity> page = new Page(curPage, limit);
        Page<VideoListEntity> page1 = ((VideoListDao) this.baseMapper).queryPage(page, video);
        return new PageUtils(page1);
    }

    @Override
    public PageUtils queryPageByCategoryId(Map<String, Object> params) {
        String categoryId = (String) params.get("categoryId");
        if (categoryId != null) {
            long curPage = 1L;
            long limit = 10L;
            if (params.get("page") != null) {
                curPage = Long.parseLong((String) params.get("page"));
            }

            if (params.get("limit") != null) {
                limit = Long.parseLong((String) params.get("limit"));
            }

            Page<VideoListEntity> page = new Page(curPage, limit);
            Page<VideoListEntity> page1 = ((VideoListDao) this.baseMapper).queryPageByCategoryId(page, categoryId);
            page1.getRecords().forEach((v) -> {
                VideoSocialEntity videoSocialEntity = this.socialService.getVideoSocialByVid(v.getVid());
                v.setVideoSocialEntity(videoSocialEntity);
            });
            return new PageUtils(page1);
        } else {
            return null;
        }
    }
}
