package cn.ljpc.electronic.service.impl;

import cn.ljpc.electronic.entity.User;
import cn.ljpc.electronic.mapper.UserMapper;
import cn.ljpc.electronic.service.IUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Primary
@Transactional
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    /**
     * @param user
     * @return
     */
    @Override
    public boolean contains(User user) {
        System.out.println("用户：" + user);
        //通过用户名，从数据库中获取该条记录，
        //获取盐值，通过md5生成hash值，比对密码
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("loginname", user.getLoginname());
        queryWrapper.select("loginname", "salt", "pwd");
        User one = super.getOne(queryWrapper);
        System.out.println("数据库中：" + one);
        if (one == null) {
            return false;
        } else {
            String salt = one.getSalt();
            String calPwd = new Md5Hash(user.getPwd(), salt, 2).toString();
            return one.getPwd().equals(calPwd);
        }
    }
}
