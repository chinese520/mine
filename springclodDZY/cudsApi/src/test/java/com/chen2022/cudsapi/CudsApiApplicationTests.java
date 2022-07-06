package com.chen2022.cudsapi;

import com.chen2022.cudsapi.dao.Goods;
import com.chen2022.cudsapi.mapper.CUDSMapper;
import com.chen2022.cudsapi.service.RedisService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
class CudsApiApplicationTests {

    @Autowired
    public CUDSMapper cudsMapper;

    @Test
    void contextLoads() {
    }

    @Test
    public void test01(){
        System.out.println(cudsMapper.findAllGoods(10));
    }

    @Test
    public void test02(){
        for (int i=0;i<35;i++){
            Goods goods = new Goods(null,"测试数据"+i, 3, "轻轻巧巧",
                    "皮实", "2022-03-21", "2022-06-03");
            System.out.println(cudsMapper.insertGoods(goods));
        }

//        System.out.println(cudsMapper.deleteGoodsById("100024"));
    }

    @Test
    public void test03(){
        Goods goods = new Goods(100014,"爱疯手机", 3, "果粉真爱无敌",
                "您的电量已不足", "2022-03-21", "2022-06-12");
        System.out.println(cudsMapper.updateNameById(goods));
    }

    @Test
    public void test04(){
        System.out.println(cudsMapper.findByVal(0,"手机"));
    }

    @Test
    public void test05(){
        System.out.println(cudsMapper.findNameByVal("手机"));
    }

    @Autowired
    private RedisTemplate redisTemplate;
    @Test
    public void test06(){
        Goods goods = new Goods(100014,"爱疯手机", 3, "果粉真爱无敌",
                "您的电量已不足", "2022-03-21", "2022-06-12");
        redisTemplate.opsForValue().set("test01",goods,1, TimeUnit.HOURS);
        Object o = redisTemplate.opsForValue().get("redis01");
        System.out.println(o);
    }

    @Autowired
    private RedisService redisService;
    @Test
    public void test07(){
//        redisService.setDatabase(2);
        redisService.test();
    }

}
