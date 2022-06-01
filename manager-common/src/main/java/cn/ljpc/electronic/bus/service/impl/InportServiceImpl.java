package cn.ljpc.electronic.bus.service.impl;

import cn.ljpc.electronic.bus.entity.Goods;
import cn.ljpc.electronic.bus.entity.Inport;
import cn.ljpc.electronic.bus.mapper.GoodsMapper;
import cn.ljpc.electronic.bus.mapper.InportMapper;
import cn.ljpc.electronic.bus.service.IInportService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

@Primary
@Service
@Transactional
public class InportServiceImpl extends ServiceImpl<InportMapper, Inport> implements IInportService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private InportMapper inportMapper;

    /**
     * 保存商品进货
     *
     * @param entity
     * @return
     */
    @Override
    public boolean save(Inport entity) {
        //根据商品ID查询商品
        Goods goods = goodsMapper.selectById(entity.getGoodsid());
        goods.setNumber(goods.getNumber() + entity.getNumber());
        goodsMapper.updateById(goods);
        //保存进货信息
        return super.save(entity);
    }

    /**
     * 更新商品进货
     *
     * @param entity
     * @return
     */
    @Override
    public boolean updateById(Inport entity) {
        //根据进货ID查询进货信息
        Inport inport = baseMapper.selectById(entity.getId());
        //根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(entity.getGoodsid());
        //库存算法  当前库存-进货单修改之前的数量+修改之后的数量
        goods.setNumber(goods.getNumber() - inport.getNumber() + entity.getNumber());
        goodsMapper.updateById(goods);
        //更新进货单
        return super.updateById(entity);
    }

    /**
     * 删除商品进货信息
     *
     * @param id
     * @return
     */
    @Override
    public boolean removeById(Serializable id) {
        //根据进货ID查询进货信息
        Inport inport = baseMapper.selectById(id);
        //根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(inport.getGoodsid());
        //库存算法  当前库存-进货单数量
        goods.setNumber(goods.getNumber() - inport.getNumber());
        goodsMapper.updateById(goods);
        //更新商品的数量
        return super.removeById(id);
    }

    @Override
    public boolean exist(String uuid) {
        QueryWrapper<Inport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uuid", uuid);
        queryWrapper.ne("number", 0);
        return inportMapper.selectCount(queryWrapper) > 0;
    }
}
