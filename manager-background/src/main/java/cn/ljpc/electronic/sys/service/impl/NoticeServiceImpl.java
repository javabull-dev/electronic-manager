package cn.ljpc.electronic.sys.service.impl;

import cn.ljpc.electronic.sys.entity.Notice;
import cn.ljpc.electronic.sys.mapper.NoticeMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.ljpc.electronic.sys.service.INoticeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

}
