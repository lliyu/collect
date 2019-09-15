package com.site.collect.exception;

/**
 * @desc: 全局异常统一处理
 */
public class BizException extends RuntimeException{

    /**
     * 返回结果
     */
    private Object result;

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
