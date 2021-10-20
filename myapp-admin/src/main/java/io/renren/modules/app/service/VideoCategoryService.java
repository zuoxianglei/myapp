package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.VideoCategoryEntity;

import java.util.Map;

/**
 * @author Administrator
 */
public abstract interface VideoCategoryService extends IService<VideoCategoryEntity> {
    public abstract PageUtils queryPage(Map<String, Object> paramMap);
}