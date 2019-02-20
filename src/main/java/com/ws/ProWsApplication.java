package com.ws;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ws.mapper")
public class ProWsApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProWsApplication.class, args);
	}

}

