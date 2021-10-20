package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@TableName("app_news")
public class NewsEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId
    private Integer newsId;
    private String newsTitle;
    private String authorName;
    private String headerUrl;
    private Integer commentCount;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date releaseDate;
    private Integer type;

    @TableField(exist = false)
    private List<NewsThumbEntity> thumbEntities;

    @TableField(exist = false)
    private List<String> imgList;

    public Integer getNewsId() {
        return this.newsId;
    }

    public String getNewsTitle() {
        return this.newsTitle;
    }

    public String getAuthorName() {
        return this.authorName;
    }

    public String getHeaderUrl() {
        return this.headerUrl;
    }

    public Integer getCommentCount() {
        return this.commentCount;
    }

    public Date getReleaseDate() {
        return this.releaseDate;
    }

    public Integer getType() {
        return this.type;
    }

    public List<NewsThumbEntity> getThumbEntities() {
        return this.thumbEntities;
    }

    public List<String> getImgList() {
        return this.imgList;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public void setHeaderUrl(String headerUrl) {
        this.headerUrl = headerUrl;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public void setThumbEntities(List<NewsThumbEntity> thumbEntities) {
        this.thumbEntities = thumbEntities;
    }

    public void setImgList(List<String> imgList) {
        this.imgList = imgList;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof NewsEntity)) {
            return false;
        }
        NewsEntity other = (NewsEntity) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$newsId = getNewsId();
        Object other$newsId = other.getNewsId();
        if (this$newsId == null ? other$newsId != null : !this$newsId.equals(other$newsId)) {
            return false;
        }
        Object this$newsTitle = getNewsTitle();
        Object other$newsTitle = other.getNewsTitle();
        if (this$newsTitle == null ? other$newsTitle != null : !this$newsTitle.equals(other$newsTitle)) {
            return false;
        }
        Object this$authorName = getAuthorName();
        Object other$authorName = other.getAuthorName();
        if (this$authorName == null ? other$authorName != null : !this$authorName.equals(other$authorName)) {
            return false;
        }
        Object this$headerUrl = getHeaderUrl();
        Object other$headerUrl = other.getHeaderUrl();
        if (this$headerUrl == null ? other$headerUrl != null : !this$headerUrl.equals(other$headerUrl)) {
            return false;
        }
        Object this$commentCount = getCommentCount();
        Object other$commentCount = other.getCommentCount();
        if (this$commentCount == null ? other$commentCount != null : !this$commentCount.equals(other$commentCount)) {
            return false;
        }
        Object this$releaseDate = getReleaseDate();
        Object other$releaseDate = other.getReleaseDate();
        if (this$releaseDate == null ? other$releaseDate != null : !this$releaseDate.equals(other$releaseDate)) {
            return false;
        }
        Object this$type = getType();
        Object other$type = other.getType();
        if (this$type == null ? other$type != null : !this$type.equals(other$type)) {
            return false;
        }
        Object this$thumbEntities = getThumbEntities();
        Object other$thumbEntities = other.getThumbEntities();
        if (this$thumbEntities == null ? other$thumbEntities != null : !this$thumbEntities.equals(other$thumbEntities)) {
            return false;
        }
        Object this$imgList = getImgList();
        Object other$imgList = other.getImgList();
        return this$imgList == null ? other$imgList == null : this$imgList.equals(other$imgList);
    }

    protected boolean canEqual(Object other) {
        return other instanceof NewsEntity;
    }

    @Override
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        Object $newsId = getNewsId();
        result = result * 59 + ($newsId == null ? 43 : $newsId.hashCode());
        Object $newsTitle = getNewsTitle();
        result = result * 59 + ($newsTitle == null ? 43 : $newsTitle.hashCode());
        Object $authorName = getAuthorName();
        result = result * 59 + ($authorName == null ? 43 : $authorName.hashCode());
        Object $headerUrl = getHeaderUrl();
        result = result * 59 + ($headerUrl == null ? 43 : $headerUrl.hashCode());
        Object $commentCount = getCommentCount();
        result = result * 59 + ($commentCount == null ? 43 : $commentCount.hashCode());
        Object $releaseDate = getReleaseDate();
        result = result * 59 + ($releaseDate == null ? 43 : $releaseDate.hashCode());
        Object $type = getType();
        result = result * 59 + ($type == null ? 43 : $type.hashCode());
        Object $thumbEntities = getThumbEntities();
        result = result * 59 + ($thumbEntities == null ? 43 : $thumbEntities.hashCode());
        Object $imgList = getImgList();
        result = result * 59 + ($imgList == null ? 43 : $imgList.hashCode());
        return result;
    }

    @Override
    public String toString() {
        return "NewsEntity(newsId=" + getNewsId() + ", newsTitle=" + getNewsTitle() + ", authorName=" + getAuthorName() + ", headerUrl=" + getHeaderUrl() + ", commentCount=" + getCommentCount() + ", releaseDate=" + getReleaseDate() + ", type=" + getType() + ", thumbEntities=" + getThumbEntities() + ", imgList=" + getImgList() + ")";
    }

}