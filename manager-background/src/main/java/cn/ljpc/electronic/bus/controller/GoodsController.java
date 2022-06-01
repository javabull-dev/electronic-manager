package cn.ljpc.electronic.bus.controller;


import cn.ljpc.electronic.bus.service.IGoodsService;
import cn.ljpc.electronic.bus.service.IProviderService;
import cn.ljpc.electronic.sys.common.AppFileUtils;
import cn.ljpc.electronic.sys.common.Constast;
import cn.ljpc.electronic.sys.common.DataGridView;
import cn.ljpc.electronic.sys.common.ResultObj;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import cn.ljpc.electronic.bus.entity.Goods;
import cn.ljpc.electronic.bus.entity.Provider;
import cn.ljpc.electronic.bus.vo.GoodsVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 元器件管理
 */
@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IProviderService providerService;

    /**
     * 查询元器件
     * @param goodsVo
     * @return
     */
    @RequestMapping("loadAllGoods")
    public DataGridView loadAllGoods(GoodsVo goodsVo){
        IPage<Goods> page = new Page<>(goodsVo.getPage(),goodsVo.getLimit());
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(goodsVo.getProviderid()!=null&&goodsVo.getProviderid()!=0,"providerid",goodsVo.getProviderid());
        queryWrapper.like(StringUtils.isNotBlank(goodsVo.getGoodsname()),"goodsname",goodsVo.getGoodsname());
        queryWrapper.like(StringUtils.isNotBlank(goodsVo.getProductcode()),"productcode",goodsVo.getProductcode());
        queryWrapper.like(StringUtils.isNotBlank(goodsVo.getPromitcode()),"promitcode",goodsVo.getPromitcode());
        queryWrapper.like(StringUtils.isNotBlank(goodsVo.getDescription()),"description",goodsVo.getDescription());
        queryWrapper.like(StringUtils.isNotBlank(goodsVo.getSize()),"size",goodsVo.getSize());
        queryWrapper.orderByDesc("id");
        goodsService.page(page,queryWrapper);
        List<Goods> records = page.getRecords();
        for (Goods goods : records) {
            Provider provider = providerService.getById(goods.getProviderid());
            if (null!=provider){
                goods.setProvidername(provider.getProvidername());
            }
        }
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    /**
     * 添加元器件
     * @param goodsVo
     * @return
     */
    @RequestMapping("addGoods")
    public ResultObj addGoods(GoodsVo goodsVo){
        try {
            if (goodsVo.getGoodsimg()!=null&&goodsVo.getGoodsimg().endsWith("_temp")){
                String newName = AppFileUtils.renameFile(goodsVo.getGoodsimg());
                goodsVo.setGoodsimg(newName);
            }
            goodsService.save(goodsVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改元器件
     * @param goodsVo
     * @return
     */
    @RequestMapping("updateGoods")
    public ResultObj updateGoods(GoodsVo goodsVo){
        try {
            //元器件图片不是默认图片
            if (!(goodsVo.getGoodsimg()!=null&&goodsVo.getGoodsimg().equals(Constast.DEFAULT_IMG))){
                if (goodsVo.getGoodsimg().endsWith("_temp")){
                    String newName = AppFileUtils.renameFile(goodsVo.getGoodsimg());
                    goodsVo.setGoodsimg(newName);
                    //删除原先的图片
                    String oldPath = goodsService.getById(goodsVo.getId()).getGoodsimg();
                    AppFileUtils.removeFileByPath(oldPath);
                }
            }
            goodsService.updateById(goodsVo);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除元器件
     * @param id
     * @return
     */
    @RequestMapping("deleteGoods")
    public ResultObj deleteGoods(Integer id,String goodsimg){
        try {
            //删除元器件的图片
            AppFileUtils.removeFileByPath(goodsimg);
            goodsService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 加载所有可用的元器件
     * @return
     */
    @RequestMapping("loadAllGoodsForSelect")
    public DataGridView loadAllGoodsForSelect(){
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("available",Constast.AVAILABLE_TRUE);
        List<Goods> list = goodsService.list(queryWrapper);
        for (Goods goods : list) {
            Provider provider = providerService.getById(goods.getProviderid());
            if (null!=provider){
                goods.setProvidername(provider.getProvidername());
            }
        }
        return new DataGridView(list);
    }

    /**
     * 根据供应商ID查询元器件信息
     * @param providerid    供应商ID
     * @return
     */
    @RequestMapping("loadGoodsByProviderId")
    public DataGridView loadGoodsByProviderId(Integer providerid){
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("available",Constast.AVAILABLE_TRUE);
        queryWrapper.eq(providerid!=null,"providerid",providerid);
        List<Goods> list = goodsService.list(queryWrapper);
        for (Goods goods : list) {
            Provider provider = providerService.getById(goods.getProviderid());
            if (null!=provider){
                goods.setProvidername(provider.getProvidername());
            }
        }
        return new DataGridView(list);
    }
}

