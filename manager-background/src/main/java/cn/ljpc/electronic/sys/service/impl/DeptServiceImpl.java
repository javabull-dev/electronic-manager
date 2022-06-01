package cn.ljpc.electronic.sys.service.impl;

import cn.ljpc.electronic.sys.entity.Dept;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.ljpc.electronic.sys.mapper.DeptMapper;
import cn.ljpc.electronic.sys.service.IDeptService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;


@Service
@Transactional
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

    @Override
    public Dept getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean update(Dept entity, Wrapper<Dept> updateWrapper){
        return super.update(entity,updateWrapper);
    }

    @Override
    public boolean updateById(Dept entity){
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id){
        return super.removeById(id);
    }

    @Override
    public boolean save(Dept entity) {
        return super.save(entity);
    }
}
