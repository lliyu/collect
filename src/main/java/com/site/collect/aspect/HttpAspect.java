package com.site.collect.aspect;

import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.OperatingRecord;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.OperatingRecordService;
import com.site.collect.service.PermissionService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Date;

/**
 * @desc: 请求拦截 记录每一次请求
 */
@Aspect
@Component
public class HttpAspect {

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private OperatingRecordService operatingRecordService;

    private final static Logger log = LoggerFactory.getLogger(HttpAspect.class);

    @Pointcut("execution(public * com.site.collect.controller..*(..))")
    public void record() {

    }
    /**
     * @desc: 请求执行前 记录
     */
    @Before("record()")
    public void doBefore(JoinPoint joinPoint) {
        requestIntercept(joinPoint);
    }

    @After("record()")
    public void doAfter() {
        log.info("========================== ↓响应请求↓ ==========================");
    }

    /**
     * @desc: 返回给前端的值
     */
    @AfterReturning(returning = "obj",pointcut = "record()")
    public void doAfterReturnning(Object obj) {
         log.info("请求返回值：{}",obj);
    }


    /**
     * @desc: 统一参数验证处理
     */
    @Around("execution(* com.site.collect.controller..*(..)) && args(..,bindingResult)")
    public Object doAround(ProceedingJoinPoint pjp, BindingResult bindingResult) throws Throwable {

        requestIntercept(pjp);
        Object returnVal;
        if (bindingResult.hasErrors()) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(),bindingResult.getFieldError().getDefaultMessage(),null);
        } else {
            returnVal = pjp.proceed();
        }
        return returnVal;
    }

    /**
     * @desc: 请求拦截器  进行权限校验
     */
    public void requestIntercept(JoinPoint joinPoint){

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        String requestUrl = request.getRequestURI().replaceAll(request.getContextPath(), "");
        String remoteAddr = request.getRemoteAddr();
        String method = request.getMethod();
        String args = Arrays.toString(joinPoint.getArgs());

        log.info("========================== ↓收到请求↓ ==========================");
        log.info("请求url:{}",requestUrl);
        log.info("请求源ip:{}",remoteAddr);
        log.info("请求方式:{}",method);
       // log.info("请求方法:{}",joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName()+ "()");
        log.info("请求参数:{}", args);
        log.info("getContextPath:{}",request.getContextPath());
        log.info("========================== ↑收到请求↑ ==========================");

        OperatingRecord or = new OperatingRecord();
        or.setRequestUrl(requestUrl);
        or.setRemoteAddr(remoteAddr);
        or.setMethod(method);
        or.setParams(args);
        or.setCreateTime(new Date());
//        or.setUid(super.getUserId());

        Integer count = permissionService.findCountByUrl(requestUrl);
//        if (count != 0){
//            String roleId = super.getRoleId();
//            if (StringUtils.isEmpty(roleId)) {
//                or.setFlag("授权不通过");
//                operatingRecordService.insert(or);
//                throw new MyException(new BaseResponse(EnumCode.FORBIDDEN.getValue(), EnumCode.FORBIDDEN.getText()));
//            }
//
//            Integer row = rolePermissionService.findCountByRole(roleId, request.getRequestURI().replaceAll(request.getContextPath(),""));
//            if (row == 0 && !super.getRoleName().equals("admin")) {
//                or.setFlag("授权不通过");
//                operatingRecordService.insert(or);
//                throw new MyException(new BaseResponse(EnumCode.FORBIDDEN.getValue(), EnumCode.FORBIDDEN.getText()));
//            }
//        }
        or.setFlag("授权通过");
        operatingRecordService.insert(or);
    }
}
