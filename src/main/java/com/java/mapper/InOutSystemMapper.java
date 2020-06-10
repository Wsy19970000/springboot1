package com.java.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface InOutSystemMapper {

    /**
     * 登录
     * @param userName
     * @param password
     * @return
     */
    @Select("SELECT ifnull(realName,'0') FROM users WHERE userName=#{arg0} AND  password=#{arg1}")
    String selectLogin(String userName,String password);

    /**
     * 查询所有产品信息
     * @return
     */
    @Select("SELECT * FROM product")
    List<Map<String,Object>> selectProducts();

    /**
     * 销售
     * @param paramMap
     */
    void updateSale(Map<String,Object> paramMap);

    /**
     * 查询销售信息
     * @param flag
     * @return
     */
    List<Map<String,Object>> selectSale(String flag);

    /**
     * 根据商品id查询出商品的库存数量
     * @param pid
     * @return
     */
    @Select("SELECT quantity FROM product WHERE id=#{arg0} LIMIT 1")
    int selectProductById(Long pid);

}
