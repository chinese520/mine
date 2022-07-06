package com.chen2022.cudsapi.dao;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Goods {
    private Integer gid;
    private String name;
    private int type;
    private String details;
    private String intro;
    private String initdate;
    private String editdate;

//    private String typeName;
}
