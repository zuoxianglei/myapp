package io.renren.modules.app.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.app.entity.VideoListEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * @author Administrator
 *
 */
@Mapper
public interface VideoListDao extends BaseMapper<VideoListEntity> {

  Page<VideoListEntity> queryPage(
          Page<VideoListEntity> paramPage, @Param("video") VideoListEntity paramVideoListEntity);

  Page<VideoListEntity> queryPageByCategoryId(
          Page<VideoListEntity> paramPage, @Param("categoryId") String paramString);
}