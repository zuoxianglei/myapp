package io.renren.modules.app.repository;

import io.renren.modules.app.entity.CollectEntity;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * @author Administrator
 * 收集库
 */
public abstract interface CollectRepository extends MongoRepository<CollectEntity, String> {
    public abstract CollectEntity findByUidAndVid(Long paramLong, int paramInt);
}