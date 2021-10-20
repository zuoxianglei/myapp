package io.renren.modules.app.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.app.entity.NewsEntity;

import java.util.Map;

/**
 * @author Administrator
 */
public abstract interface NewsService extends IService<NewsEntity> {
    public abstract PageUtils queryPage(Map<String, Object> paramMap);

    public abstract PageUtils queryPageApp(Map<String, Object> paramMap);
}