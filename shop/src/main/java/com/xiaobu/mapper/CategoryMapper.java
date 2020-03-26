package com.xiaobu.mapper;

import com.xiaobu.pojo.Category;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper {
    //查询总的分类
    @Select("select * from category where cid like '_'")
    List<Category> findAllCats() throws Exception;
}
