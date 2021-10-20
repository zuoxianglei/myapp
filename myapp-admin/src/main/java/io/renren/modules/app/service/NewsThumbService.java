package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.NewsThumbEntity;

import java.util.Map;

/**
 * @author Administrator
 */
public abstract interface NewsThumbService extends IService<NewsThumbEntity> {
    public abstract PageUtils queryPage(Map<String, Object> paramMap);
}