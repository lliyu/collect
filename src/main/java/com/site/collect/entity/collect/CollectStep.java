package com.site.collect.entity.collect;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "collect_step")
public class CollectStep implements Serializable {

    @Id
    private Long id;

    @Column(name = "cid")
    private Long collectId;
    @Column(name = "cname")
    private String name;
    @Column(name = "step_index")
    private Integer index;

    @Column(name = "addr")
    private String addr;
    @Column(name = "step_value")
    private String value;

    /**
     * 表达式匹配模式
     * 0:正则
     * 1：xpath
     */
    private Integer mode;

    @Column(name = "mapping")
    private String mapping;

    @Column(name = "page")
    private boolean page;

    @Column(name = "end")
    private boolean end;

    @Column(name = "format_mode")
    private Integer formatMode;

    @Column(name = "format")
    private String format;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public boolean isPage() {
        return page;
    }

    public boolean isEnd() {
        return end;
    }

    public void setEnd(boolean end) {
        this.end = end;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public Integer getFormatMode() {
        return formatMode;
    }

    public void setFormatMode(Integer formatMode) {
        this.formatMode = formatMode;
    }

    public void setPage(boolean page) {
        this.page = page;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getMapping() {
        return mapping;
    }

    public void setMapping(String mapping) {
        this.mapping = mapping;
    }

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
}
