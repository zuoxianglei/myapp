package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Administrator
 */
@TableName("news_thumb")
public class NewsThumbEntity implements Serializable {

  private static final long serialVersionUID = 1L;

  @TableId
  private Integer thumbId;
  private String thumbUrl;
  private Integer newsId;

  public Integer getThumbId()
  {
    return this.thumbId;
  }

  public String getThumbUrl() {
    return this.thumbUrl;
  }

  public Integer getNewsId() {
    return this.newsId;
  }

  public void setThumbId(Integer thumbId)
  {
    this.thumbId = thumbId; }
  public void setThumbUrl(String thumbUrl) { this.thumbUrl = thumbUrl; }
  public void setNewsId(Integer newsId) { this.newsId = newsId; }
  @Override
  public boolean equals(Object o) { if (o == this) {
    return true;
  }
    if (!(o instanceof NewsThumbEntity)) {
      return false;
    }
    NewsThumbEntity other = (NewsThumbEntity)o; if (!other.canEqual(this)) {
      return false;
    }
    Object this$thumbId = getThumbId(); Object other$thumbId = other.getThumbId(); if (this$thumbId == null ? other$thumbId != null : !this$thumbId.equals(other$thumbId)) {
      return false;
    }
    Object this$thumbUrl = getThumbUrl(); Object other$thumbUrl = other.getThumbUrl(); if (this$thumbUrl == null ? other$thumbUrl != null : !this$thumbUrl.equals(other$thumbUrl)) {
      return false;
    }
    Object this$newsId = getNewsId(); Object other$newsId = other.getNewsId(); return this$newsId == null ? other$newsId == null : this$newsId.equals(other$newsId); }
  protected boolean canEqual(Object other) { return other instanceof NewsThumbEntity; }
  @Override
  public int hashCode() { int PRIME = 59; int result = 1; Object $thumbId = getThumbId(); result = result * 59 + ($thumbId == null ? 43 : $thumbId.hashCode()); Object $thumbUrl = getThumbUrl(); result = result * 59 + ($thumbUrl == null ? 43 : $thumbUrl.hashCode()); Object $newsId = getNewsId(); result = result * 59 + ($newsId == null ? 43 : $newsId.hashCode()); return result; }
  @Override
  public String toString() { return "NewsThumbEntity(thumbId=" + getThumbId() + ", thumbUrl=" + getThumbUrl() + ", newsId=" + getNewsId() + ")"; }

}
