package com.chen2022.page;

import com.chen2022.feign.service.FeignService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

@SpringBootTest(classes = FeignService.class)
class PageApplicationTests {

	@Autowired
	private FeignService feignService;

	@Test
	void contextLoads() {
		System.out.println(feignService.getGoods("1"));
	}

}
