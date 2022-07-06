package com.chen2022.feign.controller;

import com.chen2022.feign.dao.Goods;
import com.chen2022.feign.dao.Msg;
import com.chen2022.feign.dao.Result;
import com.chen2022.feign.dao.TypeDao;
import com.chen2022.feign.service.FeignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/feign")
public class FeignController {

    @Autowired
    private FeignService feignService;

    @GetMapping ("/getGoods")
    public Result getGoods(String page){
        Result result = feignService.getGoods(page);
        return result;
    }

    @GetMapping("/totalPage")
    public int getTotalPage(){
        return feignService.getTotalPage();
    }

    @GetMapping("/findGoods")
    public Result findGoods(String page,String val){
        if (val==null)
            val="";
        return feignService.findGoods(page,val);
    }

    @GetMapping("/findGoodsName")
    public List<String> findGoodsName(String val){
        return feignService.findGoodsName(val);
    }

    @GetMapping("/getAllType")
    public List<TypeDao> getAllType(){
        return feignService.getAllType();
    }

    @PostMapping("/addGoods")
    public String addGoods(@RequestBody Goods goods){
        return feignService.addGoods(goods);
    }

    @PostMapping("/updateGoods")
    public String updateGoods(@RequestBody Goods goods){
        return feignService.updateGoods(goods);
    }

    @PostMapping(value = "/deleteGoods")
    public List<Msg> deleteGoods(@RequestBody List<String> ids){
        return feignService.deleteGoods(ids);
    }


    @GetMapping("/test")
    public String getString(){
        String page="1";
        System.out.println(feignService.getGoods(page));
        return "ok";
    }

    @GetMapping("test01")
    public String test01(){
        Goods goods = new Goods(100011,"牛奶白肤白梦妍", 3, "白鹿",
                "搞笑女", "2022-03-21", "2022-06-13");
        System.out.println(feignService.updateGoods(goods));
        return "test01";
    }
}
