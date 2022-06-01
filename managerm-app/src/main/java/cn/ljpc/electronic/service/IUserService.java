package cn.ljpc.electronic.service;

import cn.ljpc.electronic.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

public interface IUserService extends IService<User> {

    boolean contains(User user);
}
