package cn.ljpc.electronic.controller;

import cn.ljpc.electronic.bus.entity.GoodsInfo;
import cn.ljpc.electronic.bus.entity.Inport;
import cn.ljpc.electronic.bus.entity.InportVo;
import cn.ljpc.electronic.bus.service.IGoodsService;
import cn.ljpc.electronic.bus.service.IInportService;
import cn.ljpc.electronic.bus.service.IOutportService;
import cn.ljpc.electronic.bus.service.IProviderService;
import cn.ljpc.electronic.sys.common.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping(value = "port")
public class PortController {

    @Autowired
    private IInportService inportService;

    @Autowired
    private IProviderService providerService;

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IOutportService outportService;

    /**
     * 获取元器件信息，判单元器件是否合法
     * 入库查询
     *
     * @return
     */
    @PostMapping("info")
    public CommonResult goodsInfo(String goodsname, String providername, String uuid) {
        System.out.println("goodsname=" + goodsname + ",providername=" + providername + ",uuid=" + uuid);
        Integer providerid = providerService.getGoodInfo(providername);
        if (providerid != null) {
            GoodsInfo goodsInfo = goodsService.getGoodInfo(goodsname, providerid);
            if (goodsInfo == null) {
                return CommonResult.error().data("msg", "仓库中不存在该类元器件信息，入库不合法");
            } else {
                boolean flag = inportService.exist(uuid);
                return flag ? CommonResult.error().data("msg", "该元器件已存在库中，不允许重复入库")
                        : CommonResult.success()
                        .data("providerid", goodsInfo.getProviderid())
                        .data("goodsid", goodsInfo.getGoodsid());
            }
        } else {
            return CommonResult.error().data("msg", "仓库中不存在该类元器件信息，入库不合法");
        }
    }

    /**
     * 是否符合出库条件
     *
     * @param uuid
     * @return
     */
    @PostMapping("exist")
    public CommonResult exist(String uuid) {
        if (inportService.exist(uuid)) {
            return CommonResult.success();
        }
        return CommonResult.error().data("msg", "元器件不存在，无法出库");
    }

    /**
     * 元器件入库
     *
     * @return
     */
    @PostMapping("in")
    public CommonResult inport(InportVo vo) {
        try {
            Inport inport = new Inport();
            inport.setProviderid((int) Float.parseFloat(vo.getProviderid()));
            inport.setGoodsid((int) Float.parseFloat(vo.getGoodsid()));
            inport.setNumber((int) Float.parseFloat(vo.getNumber()));
            inport.setSize(vo.getSize());
            inport.setInportprice(vo.getInportprice());
            inport.setUuid(vo.getUuid());
            inport.setInporttime(new Date());
            inport.setOperateperson(vo.getOperateperson());
            inportService.save(inport);
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResult.error();
        }
        return CommonResult.success();
    }

    /**
     * 元器件出库
     *
     * @return
     */
    @PostMapping("out")
    public CommonResult outport(String uuid, String number, String operateperson) {
        System.out.println("uuid=" + uuid + ",number=" + number + ",operateperson=" + operateperson);
        try {
            outportService.addOutport(uuid, number, operateperson);
        } catch (Exception e) {
            return CommonResult.error();
        }
        return CommonResult.success();
    }
}
