package cn.ljpc.electronic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.util.unit.DataSize;

import javax.servlet.MultipartConfigElement;

@Configuration
@SpringBootApplication(scanBasePackages = "cn.ljpc")
@MapperScan(basePackages = {"cn.ljpc.electronic.*.mapper"})
@EnableScheduling //开启对定时任务的支持
public class ElectronicApplication {

    public static void main(String[] args) {
        SpringApplication.run(ElectronicApplication.class, args);
    }

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        /**
         * 单个数据大小
         */
        factory.setMaxFileSize(DataSize.parse("102400KB"));
        /**
         * 总上传数据大小
         */
        factory.setMaxRequestSize(DataSize.parse("102400KB"));
        return factory.createMultipartConfig();
    }
}

