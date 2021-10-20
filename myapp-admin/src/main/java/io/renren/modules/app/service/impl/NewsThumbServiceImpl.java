package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.app.dao.NewsThumbDao;
import io.renren.modules.app.entity.NewsThumbEntity;
import io.renren.modules.app.service.NewsThumbService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service("newsThumbService")
public class NewsThumbServiceImpl extends ServiceImpl<NewsThumbDao, NewsThumbEntity>
        implements NewsThumbService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage page = page(new Query()
                        .getPage(params),
                new QueryWrapper());

        return new PageUtils(page);
    }
}