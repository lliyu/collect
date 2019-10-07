package com.site.collect.pojo.dto;

import java.io.Serializable;

public class AbstractQuery4Service implements Serializable {

    private int start;

    private int pageSize;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
