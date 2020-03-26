package com.xiaobu.service;

import com.xiaobu.pojo.Category;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public interface CategoryService {
    //查询所有分类
    List<Category> findAllCats() throws Exception;
}
