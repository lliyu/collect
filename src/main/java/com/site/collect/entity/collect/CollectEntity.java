package com.site.collect.entity.collect;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Table(name = "collect")
public class CollectEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 主键回写
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "step")
    private int step;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "uid")
    private long uid;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
