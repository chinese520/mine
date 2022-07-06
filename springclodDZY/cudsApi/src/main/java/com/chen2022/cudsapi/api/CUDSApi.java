package com.chen2022.cudsapi.api;

import com.chen2022.cudsapi.dao.Goods;
import com.chen2022.cudsapi.dao.Msg;
import com.chen2022.cudsapi.dao.Result;
import com.chen2022.cudsapi.dao.TypeDao;
import com.chen2022.cudsapi.service.CUDSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class CUDSApi {

    @Autowired
    private CUDSService cudsService;

    @GetMapping("/getGoods")
    public Result getGoods(String page){
        System.out.println("getGoods:"+page);
        if (page==null)
            page="1";
        int start= Integer.parseInt(page);
        int totalPage = cudsService.getTotalPage();
        if(start<1){
            start=1;
        }
        if(start>totalPage){
            start=totalPage;
        }
        Result result = new Result();
        result.setPage(start);
        result.setTotalPage(totalPage);
        //一页10条数据
        result.setGoodsList(cudsService.getAllGoods((start-1)*10));
        return result;
    }

    @GetMapping("/totalPage")
    public int getTotalPage(){
        System.out.println("totalPage");
        return cudsService.getTotalPage();
    }

    @GetMapping("/findGoods")
    public Result findGoods(String page,String val){
        System.out.println("findGoods:"+page+","+val);
        if (val==null)
            val="";
        if (page==null)
            page="1";
        int start= Integer.parseInt(page);
        int totalPage = cudsService.getFindGoodsTotalPage(val);
        if(start<1){
            start=1;
        }
        if(start>totalPage){
            start=totalPage;
        }
        List<Goods> goodsList=cudsService.getGoodsByVal((start-1)*10,val);
//        System.out.println(goodsList);
        Result result = new Result();
        result.setPage(start);
        result.setTotalPage(totalPage);
        result.setGoodsList(goodsList);
        return result;
    }

    @GetMapping("/findGoodsName")
    public List<String> findGoodsName(String val){
        System.out.println("findGoodsName:"+val);
        if (val==null)
            val="";
        return cudsService.getGoodsNameByVal(val);
    }

    @GetMapping("/getAllType")
    public List<TypeDao> getAllType(){
        return cudsService.getAllType();
    }

    //post请求
    @PostMapping(value = "/addGoods")
    public String addGoods(@RequestBody Goods goods){
        System.out.println("addGoods:"+goods);
        return cudsService.addGoods(goods);
    }

    //post请求
    @PostMapping(value = "/updateGoods")
    public String updateGoods(@RequestBody Goods goods){
        System.out.println("updateGoods:"+goods);
        return cudsService.updateNameById(goods);
    }

    @PostMapping(value = "/deleteGoods")
    public List<Msg> deleteGoods(@RequestBody List<String> ids){
        System.out.println("deleteGoods:"+ids);
        return cudsService.deleteGoodsById(ids);
    }

//    private final int i=0;
//    @RequestMapping("/test")
//    public String test(@PathParam("value") String value){
//        System.out.println(i);
//        return "test:"+value;
//    }
}
