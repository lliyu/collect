package com.site.collect.Enum;


/**
 * @desc: 状态码枚举
 */
public enum StatusCode {
    /**
     * 200请求成功
     */
    OK(200, "请求成功"),
    /**
     * 303登录失败
     */
    LOGIN_FAIL(303, "登录失败"),
    /**
     * 400请求参数出错
     */
    BAD_REQUEST(400, "请求参数出错"),
    /**
     * 401没有登录
     */
    UNAUTHORIZED(401, "没有登录"),
    /**
     * 403没有权限
     */
    FORBIDDEN(403, "没有权限"),
    /**
     * 410已被删除
     */
    NONE(410, "已被删除"),
    /**
     * 423已被锁定
     */
    LOCKED(423, "已被锁定"),
    /**
     * 500服务器出错
     */
    INTERNAL_SERVER_ERROR(500, "服务器出错"),
    /**
     * 异常
     */
    EXCPTION_ERROR(4001, "异常");

    private final Integer value;
    private final String msg;

    private StatusCode(Integer value, String msg) {
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
     * 获取msg
     */
    public String getMsg() {
        return this.msg;
    }
}
