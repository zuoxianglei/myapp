package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.app.dao.VideoCategoryDao;
import io.renren.modules.app.entity.VideoCategoryEntity;
import io.renren.modules.app.service.VideoCategoryService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service("videoCategoryService")
public class VideoCategoryServiceImpl extends ServiceImpl<VideoCategoryDao, VideoCategoryEntity> implements VideoCategoryService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String categoryName = (String) params.get("categoryName");
        VideoCategoryEntity videoCategoryEntity = new VideoCategoryEntity();
        if (StringUtils.isNotBlank(categoryName)) {
            videoCategoryEntity.setCategoryName("%" + categoryName + "%");
        }
        IPage page = page(new Query().getPage(params), new QueryWrapper().like(StringUtils.isNotBlank(categoryName), "category_name", categoryName));

        return new PageUtils(page);
    }
}