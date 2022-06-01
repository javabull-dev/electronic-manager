package cn.ljpc.electronic.sys.component;

import cn.ljpc.electronic.sys.entity.Statistics;
import cn.ljpc.electronic.sys.service.ILoginfoService;
import cn.ljpc.electronic.sys.service.IStaticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author Jacker
 * @Description
 * @create 2021-11-18 10:01
 */
@Component
public class ScheduledTask {

    @Autowired
    private IStaticsService staticsService;

    @Autowired
    private ILoginfoService loginfoService;

    @Scheduled(cron = "0 0 2 1/1 * ? ")//使用corn，每天23：00执行
    public void scheduledTask() {
        int count = loginfoService.getDayIPCount(new Date());
        Statistics statistics = new Statistics();
        statistics.setCount(count);
        statistics.setCreateTime(new Date());
        staticsService.add(statistics);
    }
}
