package cn.ljpc.electronic.sys.converter;

import org.apache.log4j.Logger;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义日期转化器
 */
@Component
public class MyDateConverter implements Converter<String, Date> {

    private Logger logger = Logger.getLogger(MyDateConverter.class);

    @Override
    public Date convert(String s) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return format.parse(s);
        } catch (ParseException e) {
            logger.error(e.toString());
        }
        return null;
    }
}