package cn.ljpc.electronic.sys.controller;


import cn.ljpc.electronic.sys.common.CommonResult;
import cn.ljpc.electronic.sys.entity.Statistics;
import cn.ljpc.electronic.sys.service.IStaticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("statics")
public class StatisticsController {

    @Autowired
    private IStaticsService staticsService;

    @GetMapping("ipdata")
    public CommonResult loadIpData() {
        List<Statistics> list = staticsService.getPart(5);
        List<String> dates = new ArrayList<>();
        List<Integer> ipcount = new ArrayList<>();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = list.size() - 1; i >= 0; i--) {
            Statistics statistics = list.get(i);
            Date createTime = statistics.getCreateTime();
            dates.add(simpleDateFormat.format(createTime));
            ipcount.add(statistics.getCount());
        }

        return CommonResult.success().data("ipcount", ipcount).data("dates", dates);
    }
}
