package io.renren.modules.app.service.impl;

import io.renren.modules.app.entity.CollectEntity;
import io.renren.modules.app.entity.VideoSocialEntity;
import io.renren.modules.app.repository.CollectRepository;
import io.renren.modules.app.repository.VideoSocialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Administrator
 * 视频社交服务
 */
@Service
public class VideoSocialService {

    @Autowired
    VideoSocialRepository videoSocialRepository;

    @Autowired
    CollectRepository collectRepository;

    public VideoSocialEntity getVideoSocialByVid(Integer vid) {
        return this.videoSocialRepository.getByVid(vid);
    }

    public void update(VideoSocialEntity entity) {
        this.videoSocialRepository.save(entity);
    }

    public void update(VideoSocialEntity entity, Long uid, boolean flag) {
        if (flag) {
            CollectEntity collectEntity = new CollectEntity();
            collectEntity.setUid(uid);
            collectEntity.setVid(entity.getVid());
            this.collectRepository.save(collectEntity);
        } else {
            CollectEntity collectEntity = this.collectRepository.findByUidAndVid(uid, entity.getVid().intValue());
            this.collectRepository.delete(collectEntity);
        }
        update(entity);
    }
}