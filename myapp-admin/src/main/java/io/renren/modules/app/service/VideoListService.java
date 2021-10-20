package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.VideoListEntity;

import java.util.Map;

/**
 * @author Administrator
 */
public abstract interface VideoListService extends IService<VideoListEntity> {
    public abstract PageUtils queryPage(Map<String, Object> paramMap);

    public abstract PageUtils queryPageByCategoryId(Map<String, Object> params);
}