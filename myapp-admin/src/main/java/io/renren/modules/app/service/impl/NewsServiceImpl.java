package io.renren.modules.app.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import io.renren.modules.app.dao.NewsDao;
import io.renren.modules.app.entity.NewsEntity;
import io.renren.modules.app.service.NewsService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author Administrator
 */
@Service("newsService")
public class NewsServiceImpl extends ServiceImpl<NewsDao, NewsEntity> implements NewsService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String author = (String) params.get("author");
        IPage page = page(new Query()
                        .getPage(params),
        new QueryWrapper().like(StringUtils.isNotBlank(author),
                  "author_name", author));

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageApp(Map<String, Object> params) {
        String author = (String) params.get("author");
        NewsEntity newsEntity = new NewsEntity();
        if (StringUtils.isNotBlank(author)) {
            newsEntity.setAuthorName("%" + author + "%");
        }
        long curPage = 1L;
        long limit = 10L;
        if (params.get("page") != null) {
            curPage = Long.parseLong((String) params.get("page"));
        }
        if (params.get("limit") != null) {
            limit = Long.parseLong((String) params.get("limit"));
        }

        Page page = new Page(curPage, limit);
        Page page1 = this.baseMapper.queryPageApp(page, newsEntity);
        return new PageUtils(page1);
    }
}