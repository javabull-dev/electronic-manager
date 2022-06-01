package cn.ljpc.electronic.sys.service.impl;

import cn.ljpc.electronic.sys.entity.Loginfo;
import cn.ljpc.electronic.sys.mapper.LoginfoMapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.ljpc.electronic.sys.service.ILoginfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
@Transactional
public class LoginfoServiceImpl extends ServiceImpl<LoginfoMapper, Loginfo> implements ILoginfoService {

    @Override
    public Integer getDayIPCount(Date date) {
        QueryWrapper<Loginfo> queryWrapper = new QueryWrapper<>();
        String time = new SimpleDateFormat("yyyy-MM-dd").format(date);
        queryWrapper.select("distinct loginip");
        queryWrapper.ge("logintime", time);
        return super.list(queryWrapper).size();
    }
}
