package com.chen2022.feign.service;

import com.chen2022.feign.dao.Goods;
import com.chen2022.feign.dao.Msg;
import com.chen2022.feign.dao.Result;
import com.chen2022.feign.dao.TypeDao;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

@Service
@FeignClient(value = "cudsservice",fallback = FeignServiceImpl.class)
public interface FeignService {
    @GetMapping ("/api/getGoods")
    public Result getGoods(@RequestParam("page") String page);

    @GetMapping("/api/totalPage")
    public int getTotalPage();

    @GetMapping("/api/findGoods")
    public Result findGoods(@RequestParam("page") String page,@RequestParam("val") String val);

    @GetMapping("/api/findGoodsName")
    public List<String> findGoodsName(@RequestParam("val") String val);

    @GetMapping("/api/getAllType")
    public List<TypeDao> getAllType();

    @PostMapping("/api/addGoods")
    public String addGoods(@RequestBody Goods goods);

    @PostMapping("/api/updateGoods")
    public String updateGoods(@RequestBody Goods goods);

    @PostMapping(value = "/api/deleteGoods")
    public List<Msg> deleteGoods(@RequestBody List<String> ids);
}
