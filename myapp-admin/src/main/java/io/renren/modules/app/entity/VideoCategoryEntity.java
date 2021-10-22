package io.renren.modules.app.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

@TableName("video_category")
public class VideoCategoryEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private Integer categoryId;
    private String categoryName;

    public Integer getCategoryId() {
        return this.categoryId;
    }

    public String getCategoryName() {
        return this.categoryName;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof VideoCategoryEntity)) {
            return false;
        }
        VideoCategoryEntity other = (VideoCategoryEntity) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$categoryId = getCategoryId();
        Object other$categoryId = other.getCategoryId();
        if (this$categoryId == null ? other$categoryId != null : !this$categoryId.equals(other$categoryId)) {
            return false;
        }
        Object this$categoryName = getCategoryName();
        Object other$categoryName = other.getCategoryName();
        return this$categoryName == null ? other$categoryName == null : this$categoryName.equals(other$categoryName);
    }

    protected boolean canEqual(Object other) {
        return other instanceof VideoCategoryEntity;
    }

    @Override
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        Object $categoryId = getCategoryId();
        result = result * 59 + ($categoryId == null ? 43 : $categoryId.hashCode());
        Object $categoryName = getCategoryName();
        result = result * 59 + ($categoryName == null ? 43 : $categoryName.hashCode());
        return result;
    }

    @Override
    public String toString() {
        return "VideoCategoryEntity(categoryId=" + getCategoryId() + ", categoryName=" + getCategoryName() + ")";
    }

}
