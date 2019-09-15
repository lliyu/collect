package com.site.collect.controller;

import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.Enum.RoleType;
import com.site.collect.entity.User;
import com.site.collect.ftp.UploadUtil;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.UserDto;
import com.site.collect.pojo.vo.UserInfoVo;
import com.site.collect.pojo.vo.UserVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    private UserService userService;

    Map<String, String> uploadImg;

    /**
     * 上传用户头像
     */
    @ResponseBody
    @RequestMapping(value = "/uploadHander", method = RequestMethod.POST)
    public String uploadLogo(HttpServletRequest request) {
        uploadImg = new HashMap<String, String>();
        uploadImg = UploadUtil.uploadImage(request, "vue_shiro_photo/userImg");
        return uploadImg.get("userImg");
    }

    @RequestMapping("/upload")
    @ResponseBody
    public String handleFileUpload(MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                /*
                 * 这段代码执行完毕之后，图片上传到了工程的跟路径； 大家自己扩散下思维，如果我们想把图片上传到
                 * d:/files大家是否能实现呢？ 等等;
                 * 这里只是简单一个例子,请自行参考，融入到实际中可能需要大家自己做一些思考，比如： 1、文件路径； 2、文件名；
                 * 3、文件格式; 4、文件大小的限制;
                 */
                BufferedOutputStream out = new BufferedOutputStream(
                        new FileOutputStream(new File(
                                file.getOriginalFilename())));
                System.out.println(file.getName());
                out.write(file.getBytes());
                out.flush();
                out.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            } catch (IOException e) {
                e.printStackTrace();
                return "上传失败," + e.getMessage();
            }

            return "上传成功";

        } else {
            return "上传失败，因为文件是空的.";
        }
    }

    @RequestMapping(value = "/info/{id}",method = RequestMethod.GET)
    public BaseResponse get(@PathVariable("id") String id) {
        User user = userService.get(id);
        return new BaseResponse(200, "", user);
    }


    /**
     * @desc: 查询用户
     *
     * @param dto 参数dto
     */
    @RequestMapping(value = "/findUserByPage",method = RequestMethod.GET)
    public PageInfo<UserDto> findUserByPage(ParamsDto dto) {
        dto.setType(RoleType.USER.getValue());
        PageInfo<UserDto> list = userService.findUserByPage(dto);
        return list;
    }

    /**
     * @desc: 新增用户
     */
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public Object addUser(@Valid UserVo userVo, BindingResult bindingResult) {
        return userService.addUser(userVo);
    }

    /**
     * @desc: 批量删除用户
     */
    @RequestMapping(value = "/delUsers",method = RequestMethod.POST)
    public Object delUsers(ParamsDto dto) {
        if (null == dto.getIds() || dto.getIds().length == 0) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return userService.delUsers(dto.getIds());
    }

    /**
     * 修改用户状态
     */
    @RequestMapping(value = "/editUserStatus", method = RequestMethod.POST)
    public Object editUserStatus(ParamsDto dto) {
        if (StringUtils.isEmpty(dto.getId()) || null == dto.getType()) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return userService.editUserStatus(dto.getId(), dto.getType());
    }

    /**
     * 用户修改用户个人信息
     */
    @RequestMapping(value = "/editUserInfo", method = RequestMethod.POST)
    public Object editUserInfo(UserInfoVo vo) {
        return userService.editUserInfo(vo);
    }

}
