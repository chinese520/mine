package com.chen2022.cudsapi.service;

import com.chen2022.cudsapi.dao.Goods;
import com.chen2022.cudsapi.dao.Msg;
import com.chen2022.cudsapi.dao.TypeDao;
import com.chen2022.cudsapi.mapper.CUDSMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

@Service
public class CUDSService {
    @Autowired
    private CUDSMapper cudsMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private RedisService redisService;

    public int getTotalPage(){
        int totalNumber = cudsMapper.getTotalNumber();
        int totalPage= totalNumber/10;
        if (totalNumber%10!=0)
            totalPage+=1;
        return totalPage;
    }

    public List<Goods> getAllGoods(int start){
        return cudsMapper.findAllGoods(start);
    }

    public int getFindGoodsTotalPage(String val){
        int totalNumber=cudsMapper.findGoodsTotalNum(val);
        int totalPage= totalNumber/10;
        if (totalNumber%10!=0)
            totalPage+=1;
        return totalPage;
    }

    public List<Goods> getGoodsByVal(int start,String val){
        return cudsMapper.findByVal(start,val);
    }

    public List<String> getGoodsNameByVal(String val){
        return cudsMapper.findNameByVal(val);
    }

    public List<TypeDao> getAllType(){
        Object o = redisTemplate.opsForValue().get("allType");
        List<TypeDao> allType;
        if (o!=null){
            allType=(List<TypeDao>) o;
            System.out.println("allType:"+allType);
        }else {
            allType=cudsMapper.allType();
            redisTemplate.opsForValue().set("allType",allType,1, TimeUnit.HOURS);
        }
        return allType;
    }

    public String addGoods(Goods goods){
        //保证id是自增的，非人为操作
        String str="ok";
        int a = cudsMapper.insertGoods(goods);
        if(a!=1){
            str="error";
        }
        return str;
    }

    public String updateNameById(Goods goods){
        String str="ok";
        int a = cudsMapper.updateNameById(goods);
        if(a!=1){
            str="error";
        }
        return str;
    }

    public List<Msg> deleteGoodsById(List<String> ids){
        //正则表达式判断是否为数字
        Pattern pattern = Pattern.compile("[0-9]*");
        String id;
        List<Msg> list = new ArrayList<>();
        //更换数据库1
        redisService.setDatabase(1);
        List<String> idList = (List<String>)redisTemplate.opsForValue().get("ids");
        if (idList!=null){
            idList.addAll(ids);
            redisTemplate.opsForValue().set("ids",idList,1,TimeUnit.DAYS);
        }else {
            redisTemplate.opsForValue().set("ids",ids,1,TimeUnit.DAYS);
        }
        for (int i=0;i<ids.size();i++){
            id=ids.get(i);
            boolean b = pattern.matcher(id).matches();
            int a = cudsMapper.deleteGoodsById(id);
            Goods goods = cudsMapper.getGoods(id);
            //有效期一天
            redisTemplate.opsForValue().set("goods_"+id,goods,1,TimeUnit.DAYS);
            if(a==1 && b){
                list.add(new Msg(id,"success"));
            }else {
                list.add(new Msg(id,"error"));
            }
        }
        return list;
    }
}
