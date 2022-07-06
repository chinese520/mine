package com.chen2022.cudsapi.mapper;

import com.chen2022.cudsapi.dao.Goods;
import com.chen2022.cudsapi.dao.TypeDao;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CUDSMapper {
    /**
     * 查询
     * findxxx()
     * */

    @Select("select * from `t_goods` where `gid`=#{id} ")
    public Goods getGoods(String id);

    //获取货物总数
    @Select("select count(*) from `t_goods`")
    public int getTotalNumber();

    /* 获取10条货物信息（按修改时间来）*/
    @Select("select * from `t_goods` order by `editdate` desc limit #{start},10")
    public List<Goods> findAllGoods(int start);

    @Select("select count(*) from `t_goods` where `gid` like \"%\"#{val}\"%\" or `name` like  \"%\"#{val}\"%\"")
    public int findGoodsTotalNum(String val);

    //根据id和name模糊匹配货物(8条)
    @Select("select * from `t_goods` where `gid` like \"%\"#{val}\"%\" " +
            "or `name` like  \"%\"#{val} \"%\" limit #{start},10")
    public List<Goods> findByVal(int start,String val);

    //根据id和name模糊匹配货物(6条)
    @Select("select `name` from `t_goods` where `gid` like \"%\"#{val}\"%\" or `name` like  \"%\"#{val}\"%\" limit 0,6")
    public List<String> findNameByVal(String val);

    //获取商品类型名
    @Select("select * from `t_type`")
    public List<TypeDao> allType();

    //增加货物信息
    @Insert("insert into `t_goods` " +
            "(`name`, `type`, `details`, `intro`, `initdate`, `editdate`)\n" +
            "values(#{name}, #{type}, #{details}," +
            " #{intro}, #{initdate}, #{editdate})")
    public int insertGoods(Goods goods);

    //根据id修改指定的货物信息
    @Update("update `t_goods` set `name`=#{name},`type`=#{type},`details`=#{details},\n" +
            "`intro`=#{intro},`initdate`=#{initdate},`editdate`=#{editdate}\n" +
            "where `gid`=#{gid}")
    public int updateNameById(Goods goods);

    //根据id删除指定的数据
    @Delete("delete from `t_goods` where `gid`=#{id}")
    public int deleteGoodsById(String id);
}
