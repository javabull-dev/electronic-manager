package cn.ljpc.electronic.bus.service;

import cn.ljpc.electronic.bus.entity.Inport;
import com.baomidou.mybatisplus.extension.service.IService;


public interface IInportService extends IService<Inport> {

    boolean exist(String uuid);
}
