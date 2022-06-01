package cn.ljpc.electronic.sys.service;

import cn.ljpc.electronic.sys.entity.Loginfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Date;


public interface ILoginfoService extends IService<Loginfo> {

    Integer getDayIPCount(Date date);
}
