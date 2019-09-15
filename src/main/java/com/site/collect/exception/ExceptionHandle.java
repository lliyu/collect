package com.site.collect.exception;

import com.site.collect.entity.OperatingRecord;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.ipml.OperatingRecordServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 全局异常处理
 */
@ControllerAdvice
public class ExceptionHandle {

    @Autowired
    private OperatingRecordServiceImpl operatingRecordService;

    private final  static Logger log = LoggerFactory.getLogger(ExceptionHandle.class);

    @ExceptionHandler(value = {Exception.class})
    @ResponseBody
    public Object handle(Exception e) {

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        String remoteAddr = request.getRemoteAddr();
        String method = request.getMethod();

        OperatingRecord or = new OperatingRecord();
        or.setRequestUrl(request.getRequestURI());
        or.setRemoteAddr(remoteAddr);
        or.setMethod(method);
        or.setCreateTime(new Date());
//        or.setUid(super.getUserId());
        or.setFlag("请求出错");
        operatingRecordService.insert(or);


        if (e instanceof BizException) {
            BizException myException = (BizException)e;
           return myException.getResult();
        }
        else {
            log.info("系统错误 {}",e);
            return new BaseResponse(500, e.getLocalizedMessage());
        }
    }
}
