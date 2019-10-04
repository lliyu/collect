package com.site.collect.Enum;

public enum  RequestStatus {

    LOGININVAILD(40001, "登录已失效，请重新登录！");

    private int code;
    private String desc;

    RequestStatus(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
