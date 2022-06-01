package cn.ljpc.electronic.bus.service.impl;

import cn.ljpc.electronic.bus.entity.Goods;
import cn.ljpc.electronic.bus.entity.GoodsInfo;
import cn.ljpc.electronic.bus.mapper.GoodsMapper;
import cn.ljpc.electronic.bus.service.IGoodsService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

@Primary
@Service
@Transactional
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {

    @Override
    public boolean save(Goods entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(Goods entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    public Goods getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public GoodsInfo getGoodInfo(String goodsname, Integer providerid) {
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("id");
        queryWrapper.eq("goodsname", goodsname);
        queryWrapper.eq("providerid", providerid);
        List<Goods> list = super.list(queryWrapper);
        if (list != null) {
            if (list.size() >= 1) {
                Goods goods = list.get(0);
                GoodsInfo goodsInfo = new GoodsInfo();
                goodsInfo.setGoodsid(goods.getId());
                goodsInfo.setProviderid(providerid);
                return goodsInfo;
            }

        }
        return null;
    }
}
