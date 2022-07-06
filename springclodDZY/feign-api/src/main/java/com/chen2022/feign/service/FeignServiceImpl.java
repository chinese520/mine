package com.chen2022.feign.service;

import com.chen2022.feign.dao.Goods;
import com.chen2022.feign.dao.Msg;
import com.chen2022.feign.dao.Result;
import com.chen2022.feign.dao.TypeDao;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

@Component
public class FeignServiceImpl implements FeignService {

    @Override
    public Result getGoods(String page) {
        return  new Result();
    }

    @Override
    public int getTotalPage() {
        return 0;
    }

    @Override
    public Result findGoods(String page,String val) {
        return new Result();
    }

    @Override
    public List<String> findGoodsName(String val) {
        return new ArrayList<>();
    }

    @Override
    public List<TypeDao> getAllType() {
        return new ArrayList<TypeDao>();
    }

    @Override
    public String addGoods(Goods goods) {
        return "error";
    }

    @Override
    public String updateGoods(Goods goods) {
        return "error";
    }

    @Override
    public List<Msg> deleteGoods(List<String> id) {
        return new ArrayList<Msg>();
    }
}
