package com.chen2022.cudsapi.dao;

import lombok.Data;

import java.util.List;

@Data
public class Result {
    private int page;
    private int totalPage;
    private List<Goods> goodsList;
}
