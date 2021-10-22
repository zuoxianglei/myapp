package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Administrator
 */
@TableName("video_list")
public class VideoListEntity implements Serializable {
  private static final long serialVersionUID = 1L;

  @TableId
  private Integer vid;
  private String vtitle;
  private String author;
  private String coverurl;
  private String headurl;
  private Integer commentNum;
  private Integer likeNum;
  private Integer collectNum;
  private String playurl;
  private Date createTime;
  private Date updateTime;
  private Integer categoryId;

  @TableField(exist=false)
  private String categoryName;

  @TableField(exist=false)
  private VideoSocialEntity videoSocialEntity;

  public Integer getVid()
  {
    return this.vid;
  }

  public String getVtitle() {
    return this.vtitle;
  }

  public String getAuthor() {
    return this.author;
  }

  public String getCoverurl() {
    return this.coverurl;
  }

  public String getHeadurl() {
    return this.headurl;
  }

  public Integer getCommentNum() {
    return this.commentNum;
  }

  public Integer getLikeNum() {
    return this.likeNum;
  }

  public Integer getCollectNum() {
    return this.collectNum;
  }

  public String getPlayurl() {
    return this.playurl;
  }

  public Date getCreateTime() {
    return this.createTime;
  }

  public Date getUpdateTime() {
    return this.updateTime;
  }

  public Integer getCategoryId() {
    return this.categoryId;
  }

  public String getCategoryName()
  {
    return this.categoryName;
  }
  public VideoSocialEntity getVideoSocialEntity() {
    return this.videoSocialEntity;
  }

  public void setVid(Integer vid)
  {
    this.vid = vid; }
  public void setVtitle(String vtitle) { this.vtitle = vtitle; }
  public void setAuthor(String author) { this.author = author; }
  public void setCoverurl(String coverurl) { this.coverurl = coverurl; }
  public void setHeadurl(String headurl) { this.headurl = headurl; }
  public void setCommentNum(Integer commentNum) { this.commentNum = commentNum; }
  public void setLikeNum(Integer likeNum) { this.likeNum = likeNum; }
  public void setCollectNum(Integer collectNum) { this.collectNum = collectNum; }
  public void setPlayurl(String playurl) { this.playurl = playurl; }
  public void setCreateTime(Date createTime) { this.createTime = createTime; }
  public void setUpdateTime(Date updateTime) { this.updateTime = updateTime; }
  public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }
  public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
  public void setVideoSocialEntity(VideoSocialEntity videoSocialEntity) { this.videoSocialEntity = videoSocialEntity; }
  @Override
  public boolean equals(Object o) { if (o == this) {
    return true;
  }
    if (!(o instanceof VideoListEntity)) {
      return false;
    }
    VideoListEntity other = (VideoListEntity)o; if (!other.canEqual(this)) {
      return false;
    }
    Object this$vid = getVid(); Object other$vid = other.getVid(); if (this$vid == null ? other$vid != null : !this$vid.equals(other$vid)) {
      return false;
    }
    Object this$vtitle = getVtitle(); Object other$vtitle = other.getVtitle(); if (this$vtitle == null ? other$vtitle != null : !this$vtitle.equals(other$vtitle)) {
      return false;
    }
    Object this$author = getAuthor(); Object other$author = other.getAuthor(); if (this$author == null ? other$author != null : !this$author.equals(other$author)) {
      return false;
    }
    Object this$coverurl = getCoverurl(); Object other$coverurl = other.getCoverurl(); if (this$coverurl == null ? other$coverurl != null : !this$coverurl.equals(other$coverurl)) {
      return false;
    }
    Object this$headurl = getHeadurl(); Object other$headurl = other.getHeadurl(); if (this$headurl == null ? other$headurl != null : !this$headurl.equals(other$headurl)) {
      return false;
    }
    Object this$commentNum = getCommentNum(); Object other$commentNum = other.getCommentNum(); if (this$commentNum == null ? other$commentNum != null : !this$commentNum.equals(other$commentNum)) {
      return false;
    }
    Object this$likeNum = getLikeNum(); Object other$likeNum = other.getLikeNum(); if (this$likeNum == null ? other$likeNum != null : !this$likeNum.equals(other$likeNum)) {
      return false;
    }
    Object this$collectNum = getCollectNum(); Object other$collectNum = other.getCollectNum(); if (this$collectNum == null ? other$collectNum != null : !this$collectNum.equals(other$collectNum)) {
      return false;
    }
    Object this$playurl = getPlayurl(); Object other$playurl = other.getPlayurl(); if (this$playurl == null ? other$playurl != null : !this$playurl.equals(other$playurl)) {
      return false;
    }
    Object this$createTime = getCreateTime(); Object other$createTime = other.getCreateTime(); if (this$createTime == null ? other$createTime != null : !this$createTime.equals(other$createTime)) {
      return false;
    }
    Object this$updateTime = getUpdateTime(); Object other$updateTime = other.getUpdateTime(); if (this$updateTime == null ? other$updateTime != null : !this$updateTime.equals(other$updateTime)) {
      return false;
    }
    Object this$categoryId = getCategoryId(); Object other$categoryId = other.getCategoryId(); if (this$categoryId == null ? other$categoryId != null : !this$categoryId.equals(other$categoryId)) {
      return false;
    }
    Object this$categoryName = getCategoryName(); Object other$categoryName = other.getCategoryName(); if (this$categoryName == null ? other$categoryName != null : !this$categoryName.equals(other$categoryName)) {
      return false;
    }
    Object this$videoSocialEntity = getVideoSocialEntity(); Object other$videoSocialEntity = other.getVideoSocialEntity(); return this$videoSocialEntity == null ? other$videoSocialEntity == null : this$videoSocialEntity.equals(other$videoSocialEntity); }
  protected boolean canEqual(Object other) { return other instanceof VideoListEntity; }
  @Override
  public int hashCode() { int PRIME = 59; int result = 1; Object $vid = getVid(); result = result * 59 + ($vid == null ? 43 : $vid.hashCode()); Object $vtitle = getVtitle(); result = result * 59 + ($vtitle == null ? 43 : $vtitle.hashCode()); Object $author = getAuthor(); result = result * 59 + ($author == null ? 43 : $author.hashCode()); Object $coverurl = getCoverurl(); result = result * 59 + ($coverurl == null ? 43 : $coverurl.hashCode()); Object $headurl = getHeadurl(); result = result * 59 + ($headurl == null ? 43 : $headurl.hashCode()); Object $commentNum = getCommentNum(); result = result * 59 + ($commentNum == null ? 43 : $commentNum.hashCode()); Object $likeNum = getLikeNum(); result = result * 59 + ($likeNum == null ? 43 : $likeNum.hashCode()); Object $collectNum = getCollectNum(); result = result * 59 + ($collectNum == null ? 43 : $collectNum.hashCode()); Object $playurl = getPlayurl(); result = result * 59 + ($playurl == null ? 43 : $playurl.hashCode()); Object $createTime = getCreateTime(); result = result * 59 + ($createTime == null ? 43 : $createTime.hashCode()); Object $updateTime = getUpdateTime(); result = result * 59 + ($updateTime == null ? 43 : $updateTime.hashCode()); Object $categoryId = getCategoryId(); result = result * 59 + ($categoryId == null ? 43 : $categoryId.hashCode()); Object $categoryName = getCategoryName(); result = result * 59 + ($categoryName == null ? 43 : $categoryName.hashCode()); Object $videoSocialEntity = getVideoSocialEntity(); result = result * 59 + ($videoSocialEntity == null ? 43 : $videoSocialEntity.hashCode()); return result; }
  @Override
  public String toString() { return "VideoListEntity(vid=" + getVid() + ", vtitle=" + getVtitle() + ", author=" + getAuthor() + ", coverurl=" + getCoverurl() + ", headurl=" + getHeadurl() + ", commentNum=" + getCommentNum() + ", likeNum=" + getLikeNum() + ", collectNum=" + getCollectNum() + ", playurl=" + getPlayurl() + ", createTime=" + getCreateTime() + ", updateTime=" + getUpdateTime() + ", categoryId=" + getCategoryId() + ", categoryName=" + getCategoryName() + ", videoSocialEntity=" + getVideoSocialEntity() + ")"; }

}
