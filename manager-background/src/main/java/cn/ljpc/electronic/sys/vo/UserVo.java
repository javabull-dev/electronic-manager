package cn.ljpc.electronic.sys.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserVo implements Serializable {


    private Integer id;

    private String name;

    private String loginname;

    private String pwd;

    private String address;

    private Integer sex;

    private String remark;

    private Integer deptid;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date hiredate;

    /**
     * 上级领导id
     */
    private Integer mgr;

    /**
     * 是否可用，0不可用，1可用
     */
    private Integer available;

    /**
     * 排序码
     */
    private Integer ordernum;

    /**
     * 用户类型[0超级管理员，1管理员，2普通用户]
     */
    private Integer type;

    /**
     * 用户头像地址
     */
    private String imgpath;

    /**
     * 盐
     */
    private String salt;

    /**
     * 领导名称
     */
    private String leadername;

    /**
     * 部门名称
     */
    private String deptname;


    private Integer page = 1;
    private Integer limit = 10;

    /**
     * 验证码
     */
    private String code;
}
