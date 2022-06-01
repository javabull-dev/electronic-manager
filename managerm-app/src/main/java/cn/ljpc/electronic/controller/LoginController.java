package cn.ljpc.electronic.controller;

import cn.ljpc.electronic.entity.User;
import cn.ljpc.electronic.service.IUserService;
import cn.ljpc.electronic.sys.common.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("login")
public class LoginController {

    @Autowired
    private IUserService userService;

    /**
     * 手机app登录验证
     *
     * @param user
     * @return
     */
    @PostMapping("")
    public CommonResult login(User user) {
        System.out.println("用户数据:" + user);
        System.out.println("request: ");
        boolean flag = userService.contains(user);
        return flag
                ? CommonResult.success().data("msg", "登录成功") :
                CommonResult.error().data("msg", "用户名或密码错误");
    }
}
