package cn.ljpc.electronic.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Setter;

@Data
@Setter
@TableName("sys_user")
public class User {

    @TableField("loginname")
    private String loginname;

    @TableField("pwd")
    private String pwd;

    @TableField("salt")
    private String salt;
}