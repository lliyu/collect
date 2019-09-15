package com.site.collect.Enum;

public enum RoleType {

    ADMIN(1, "超级管理员"),
    USER(2, "普通用户");

    private final int value;
    private final String text;

    RoleType(int value, String text) {
        this.value = value;
        this.text = text;
    }

    /**
     * 获取value
     */
    public Integer getValue() {
        return this.value;
    }

    /**
     * 获取Text
     */
    public String getText() {
        return this.text;
    }
}
