package cn.ljpc.electronic.sys.service;

import cn.ljpc.electronic.sys.entity.Statistics;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface IStaticsService extends IService<Statistics> {
    List<Statistics> getPart(Integer day);

    void add(Statistics one);
}
