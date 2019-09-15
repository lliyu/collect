package com.site.collect.Enum;


/**
 * @desc: 菜单类型
 */
public enum MemuType {
    //页面
    PAGE(200, "页面"),
    //按钮
    BUTTON(303, "按钮");

    private final Integer value;
    private final String msg;

    MemuType(Integer value, String msg) {
        this.value = value;
        this.msg = msg;
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
    public String getMsg() {
        return this.msg;
    }
}
