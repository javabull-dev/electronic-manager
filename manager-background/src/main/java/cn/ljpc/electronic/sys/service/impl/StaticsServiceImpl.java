package cn.ljpc.electronic.sys.service.impl;

import cn.ljpc.electronic.sys.entity.Statistics;
import cn.ljpc.electronic.sys.mapper.StatisticsMapper;
import cn.ljpc.electronic.sys.service.IStaticsService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class StaticsServiceImpl extends ServiceImpl<StatisticsMapper, Statistics> implements IStaticsService {

    /**
     * 获取最近几天的数据
     *
     * @param day
     * @return
     */
    public List<Statistics> getPart(Integer day) {
        QueryWrapper<Statistics> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("count", "create_time").orderByDesc("create_time").last("limit " + day);
        return super.list(queryWrapper);
    }

    /**
     * @param one
     */
    public void add(Statistics one) {
        super.baseMapper.insert(one);
    }
}
