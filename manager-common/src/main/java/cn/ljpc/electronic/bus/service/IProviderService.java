package cn.ljpc.electronic.bus.service;

import cn.ljpc.electronic.bus.entity.Provider;
import com.baomidou.mybatisplus.extension.service.IService;


public interface IProviderService extends IService<Provider> {

    Integer getGoodInfo(String providername);
}
