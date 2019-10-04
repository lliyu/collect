package com.site.collect.exception;

/**
 * @desc: 全局异常统一处理
 */
public class BizException extends RuntimeException{

    /**
     * 返回结果
     */

    private int code;
    private Object result;

    public BizException(int code, Object result) {
        this.code = code;
        this.result = result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public BizException(Object result) {
        this.result = result;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
