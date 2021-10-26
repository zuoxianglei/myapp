package io.renren;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Administrator
 * 项目启动入口
 */
@SpringBootApplication
public class RenrenApplication {
	public static void main(String[] args) {
		SpringApplication.run(RenrenApplication.class, args);
		System.out.println("启动成功!!!接口信息 http://localhost:9001/renren-fast/swagger/index.html");
	}
}
