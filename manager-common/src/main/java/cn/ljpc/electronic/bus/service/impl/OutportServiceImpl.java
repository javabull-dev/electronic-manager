package cn.ljpc.electronic.bus.service.impl;

import cn.ljpc.electronic.bus.entity.Goods;
import cn.ljpc.electronic.bus.entity.Inport;
import cn.ljpc.electronic.bus.entity.Outport;
import cn.ljpc.electronic.bus.mapper.GoodsMapper;
import cn.ljpc.electronic.bus.mapper.InportMapper;
import cn.ljpc.electronic.bus.mapper.OutportMapper;
import cn.ljpc.electronic.bus.service.IOutportService;
import cn.ljpc.electronic.sys.common.WebUtils;
import cn.ljpc.electronic.sys.entity.User;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.Date;

@Primary
@Service
public class OutportServiceImpl extends ServiceImpl<OutportMapper, Outport> implements IOutportService {

    @Autowired
    private InportMapper inportMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * @param id     进货单ID
     * @param number 退货数量
     * @param remark 备注
     */
    @Override
    public void addOutport(Integer id, Integer number, String remark) {
        //1.通过进货单ID查询出进货单信息
        Inport inport = inportMapper.selectById(id);
        //2.根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(inport.getGoodsid());
        //3.修改商品的数量     商品的数量-退货的数量
        goods.setNumber(goods.getNumber() - number);

        //修改进货的数量
        inport.setNumber(inport.getNumber() - number);
        inportMapper.updateById(inport);

        //4.进行修改
        goodsMapper.updateById(goods);

        //5.添加退货单信息
        Outport outport = new Outport();
        outport.setGoodsid(inport.getGoodsid());
        outport.setNumber(number);
        User user = (User) WebUtils.getSession().getAttribute("user");
        outport.setOperateperson(user.getName());

        outport.setOutportprice(inport.getInportprice());

        outport.setPaytype(inport.getPaytype());
        outport.setOutputtime(new Date());
        outport.setRemark(remark);
        outport.setProviderid(inport.getProviderid());
        //添加商品的唯一标识
        outport.setUuid(inport.getUuid());
        getBaseMapper().insert(outport);
    }

    @Override
    public void addOutport(String uuid, String numberStr, String username) {
        int number = Integer.parseInt(numberStr);
        QueryWrapper<Inport> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uuid", uuid);
        queryWrapper.eq("number", number);
        Inport inport = inportMapper.selectOne(queryWrapper);
        //2.根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(inport.getGoodsid());
        goods.setNumber(goods.getNumber());
        inport.setNumber(0);
        inportMapper.updateById(inport);
        goodsMapper.updateById(goods);

        //5.添加退货单信息
        Outport outport = new Outport();
        outport.setGoodsid(inport.getGoodsid());
        outport.setNumber(number);
        outport.setOperateperson(username);

        outport.setOutportprice(inport.getInportprice());

        outport.setPaytype(inport.getPaytype());
        outport.setOutputtime(new Date());
        outport.setProviderid(inport.getProviderid());
        //添加商品的唯一标识
        outport.setUuid(inport.getUuid());
        getBaseMapper().insert(outport);
    }
}
