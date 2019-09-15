package com.site.collect.pojo.vo;


/**
 * @desc: 用户vo
 */
public class UserVo {

    /**
     * 用户昵称
     */
    private String name;
    /**
     * 邮箱|登录帐号
     */
    private String email;
    /**
     * 密码
     */
    // @Pattern(regexp = "^[a-zA-Z]\\w{5,17}$", message = "密码以字母开头，长度在6~18之间，只能包含字符、数字和下划线")
    private String pass;

    /**
     * 状态
     */
    private Boolean status;

    /**
     * 用户角色
     */
    private Long roleId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
