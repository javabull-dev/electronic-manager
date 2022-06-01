package cn.ljpc.electronic.bus.service;

import cn.ljpc.electronic.bus.entity.Goods;
import cn.ljpc.electronic.bus.entity.GoodsInfo;
import com.baomidou.mybatisplus.extension.service.IService;


public interface IGoodsService extends IService<Goods> {
    GoodsInfo getGoodInfo(String goodsname, Integer providerid);
}
