package io.renren.modules.app.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.io.Serializable;

/**
 * @author Administrator
 * mongo
 */
@Document(collection = "collect")
public class CollectEntity implements Serializable {

    @Id
    @JsonIgnore
    private String id;
    private Integer vid;
    private Long uid;

    public String getId() {
        return this.id;
    }

    public Integer getVid() {
        return this.vid;
    }

    public Long getUid() {
        return this.uid;
    }


    public void setId(String id) {
        this.id = id;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof CollectEntity)) {
            return false;
        }
        CollectEntity other = (CollectEntity) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$id = getId();
        Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) {
            return false;
        }
        Object this$vid = getVid();
        Object other$vid = other.getVid();
        if (this$vid == null ? other$vid != null : !this$vid.equals(other$vid)) {
            return false;
        }
        Object this$uid = getUid();
        Object other$uid = other.getUid();
        return this$uid == null ? other$uid == null : this$uid.equals(other$uid);
    }

    protected boolean canEqual(Object other) {
        return other instanceof CollectEntity;
    }

    @Override
    public int hashCode() {
        int PRIME = 59;
        int result = 1;
        Object $id = getId();
        result = result * 59 + ($id == null ? 43 : $id.hashCode());
        Object $vid = getVid();
        result = result * 59 + ($vid == null ? 43 : $vid.hashCode());
        Object $uid = getUid();
        result = result * 59 + ($uid == null ? 43 : $uid.hashCode());
        return result;
    }

    @Override
    public String toString() {
        return "CollectEntity(id=" + getId() + ", vid=" + getVid() + ", uid=" + getUid() + ")";
    }

}