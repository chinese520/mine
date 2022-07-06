package com.chen2022.cudsapi.service;

import com.chen2022.cudsapi.dao.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class RedisService {

    @Autowired
    private RedisTemplate redisTemplate;


    public void test(){
        this.setDatabase(1);
        Goods goods = new Goods(100014,"爱疯手机", 3, "果粉真爱无敌",
                "您的电量已不足", "2022-03-21", "2022-06-12");
        redisTemplate.opsForValue().set("test02",goods,1, TimeUnit.HOURS);
        Object o = redisTemplate.opsForValue().get("test01");
        System.out.println(o);
    }

    //更换redis的默认库
    public void setDatabase(int num){
        LettuceConnectionFactory connectionFactory =
                (LettuceConnectionFactory) redisTemplate.getConnectionFactory();
        if(connectionFactory!=null && num!=connectionFactory.getDatabase()){
            connectionFactory.setDatabase(num);
        }
        connectionFactory.afterPropertiesSet();
        redisTemplate.setConnectionFactory(connectionFactory);
        connectionFactory.resetConnection();
        System.out.println("已切换数据库为"+
                ((LettuceConnectionFactory) redisTemplate.getConnectionFactory()).getDatabase());
    }

}
