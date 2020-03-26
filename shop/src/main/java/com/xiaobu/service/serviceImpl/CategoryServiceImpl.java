package com.xiaobu.service.serviceImpl;

import com.xiaobu.mapper.CategoryMapper;
import com.xiaobu.pojo.Category;
import com.xiaobu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;
import java.util.List;
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    public List<Category> findAllCats() throws Exception {
        return categoryMapper.findAllCats();
    }
}
