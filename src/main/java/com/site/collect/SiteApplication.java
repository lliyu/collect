package com.site.collect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@MapperScan("com.site.collect.mapper")
@SpringBootApplication
public class SiteApplication {
	public static void main(String[] args) {
		SpringApplication.run(SiteApplication.class, args);
	}
}
