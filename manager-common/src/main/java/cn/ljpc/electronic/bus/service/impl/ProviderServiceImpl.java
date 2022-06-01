package cn.ljpc.electronic.bus.service.impl;

import cn.ljpc.electronic.bus.entity.Provider;
import cn.ljpc.electronic.bus.mapper.ProviderMapper;
import cn.ljpc.electronic.bus.service.IProviderService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;

@Primary
@Service
@Transactional
public class ProviderServiceImpl extends ServiceImpl<ProviderMapper, Provider> implements IProviderService {

    @Override
    public boolean save(Provider entity) {
        return super.save(entity);
    }

    @Override
    public boolean updateById(Provider entity) {
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    public Provider getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return super.removeByIds(idList);
    }

    @Override
    public Integer getGoodInfo(String providername) {
        QueryWrapper<Provider> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("providername", providername);
        queryWrapper.select("id");
        Provider provider = super.getOne(queryWrapper);
        if (null != provider) {
            return provider.getId();
        } else {
            return null;
        }
    }
}
