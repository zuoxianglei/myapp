package io.renren.modules.app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

/**
 * @author Administrator
 * mongo
 */
@Document(collection="video")
public class VideoSocialEntity implements Serializable {

  @Id
  @JsonIgnore
  private String id;

  @JsonIgnore
  private Integer vid;
  private Integer commentnum;
  private Integer likenum;
  private Integer collectnum;
  private boolean flagLike;
  private boolean flagCollect;

  public String getId()
  {
    return this.id;
  }

  public Integer getVid() {
    return this.vid; } 
  public Integer getCommentnum() { return this.commentnum; } 
  public Integer getLikenum() { return this.likenum; } 
  public Integer getCollectnum() { return this.collectnum; } 
  public boolean isFlagLike() { return this.flagLike; } 
  public boolean isFlagCollect() { return this.flagCollect; }


  public void setId(String id)
  {
    this.id = id; } 
  public void setVid(Integer vid) { this.vid = vid; } 
  public void setCommentnum(Integer commentnum) { this.commentnum = commentnum; } 
  public void setLikenum(Integer likenum) { this.likenum = likenum; } 
  public void setCollectnum(Integer collectnum) { this.collectnum = collectnum; } 
  public void setFlagLike(boolean flagLike) { this.flagLike = flagLike; } 
  public void setFlagCollect(boolean flagCollect) { this.flagCollect = flagCollect; } 
  @Override
  public boolean equals(Object o) { if (o == this) {
    return true;
    }
    if (!(o instanceof VideoSocialEntity)) {
      return false;
    }
    VideoSocialEntity other = (VideoSocialEntity)o;
    if (!other.canEqual(this)) {
      return false;
    }
    Object this$id = getId(); Object other$id = other.getId(); if (this$id == null ? other$id != null : !this$id.equals(other$id)) {
      return false;
    }
    Object this$vid = getVid(); Object other$vid = other.getVid(); if (this$vid == null ? other$vid != null : !this$vid.equals(other$vid)) {
      return false;
    }
    Object this$commentnum = getCommentnum(); Object other$commentnum = other.getCommentnum(); if (this$commentnum == null ? other$commentnum != null : !this$commentnum.equals(other$commentnum)) {
      return false;
    }
    Object this$likenum = getLikenum(); Object other$likenum = other.getLikenum(); if (this$likenum == null ? other$likenum != null : !this$likenum.equals(other$likenum)) {
      return false;
    }
    Object this$collectnum = getCollectnum(); Object other$collectnum = other.getCollectnum(); if (this$collectnum == null ? other$collectnum != null : !this$collectnum.equals(other$collectnum)) {
      return false;
    }
    if (isFlagLike() != other.isFlagLike()) {
      return false;
    }
    return isFlagCollect() == other.isFlagCollect(); }
  protected boolean canEqual(Object other) { return other instanceof VideoSocialEntity; }
  @Override
  public int hashCode() { int PRIME = 59; int result = 1; Object $id = getId(); result = result * 59 + ($id == null ? 43 : $id.hashCode()); Object $vid = getVid(); result = result * 59 + ($vid == null ? 43 : $vid.hashCode()); Object $commentnum = getCommentnum(); result = result * 59 + ($commentnum == null ? 43 : $commentnum.hashCode()); Object $likenum = getLikenum(); result = result * 59 + ($likenum == null ? 43 : $likenum.hashCode()); Object $collectnum = getCollectnum(); result = result * 59 + ($collectnum == null ? 43 : $collectnum.hashCode()); result = result * 59 + (isFlagLike() ? 79 : 97); result = result * 59 + (isFlagCollect() ? 79 : 97); return result; }
  @Override
  public String toString() { return "VideoSocialEntity(id=" + getId() + ", vid=" + getVid() + ", commentnum=" + getCommentnum() + ", likenum=" + getLikenum() + ", collectnum=" + getCollectnum() + ", flagLike=" + isFlagLike() + ", flagCollect=" + isFlagCollect() + ")"; }

}