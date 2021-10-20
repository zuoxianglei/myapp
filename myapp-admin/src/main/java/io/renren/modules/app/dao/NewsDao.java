package io.renren.modules.app.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.app.entity.NewsEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Administrator
 */
@Mapper
public interface NewsDao extends BaseMapper<NewsEntity> {
    Page<NewsEntity> queryPageApp(Page<NewsEntity> paramPage, @Param("news") NewsEntity paramNewsEntity);
}