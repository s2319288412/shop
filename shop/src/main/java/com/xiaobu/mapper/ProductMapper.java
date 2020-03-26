package com.xiaobu.mapper;

import com.xiaobu.pojo.Product;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductMapper {
    //查询最新商品
    @Select("select * from product where pflag=0 order by pdate desc limit 0,8;")
    List<Product> findNews() throws Exception;
    //查询最热商品    //order by pdate desc
    @Select("select * from product where  pflag=0 and is_hot=1  limit 0,8;")
    public List<Product> findHots() throws Exception;
    //查询全部分类下商品
    @Select("select * from product where cid like concat(#{cid},'%')")
    public List<Product> findCategory(String cid);

    //根据pid查询商品信息
    @Select("select * from product where pid=#{pid}")
    public Product findProductByPid(@Param("pid") String pid) throws Exception;
}
