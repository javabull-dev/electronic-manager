package cn.ljpc.electronic.bus.service;

import cn.ljpc.electronic.bus.entity.Outport;
import com.baomidou.mybatisplus.extension.service.IService;


public interface IOutportService extends IService<Outport> {

    /**
     * 对商品进货进行退货处理
     * @param id    进货单ID
     * @param number    退货数量
     * @param remark    备注
     */
    void addOutport(Integer id, Integer number, String remark);

    void addOutport(String uuid, String number, String username);
}
