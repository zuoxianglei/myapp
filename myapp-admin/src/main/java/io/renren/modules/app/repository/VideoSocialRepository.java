package io.renren.modules.app.repository;

import io.renren.modules.app.entity.VideoSocialEntity;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * @author Administrator
 */
public abstract interface VideoSocialRepository extends MongoRepository<VideoSocialEntity, String> {
    public abstract VideoSocialEntity getByVid(Integer paramInteger);
}