package com.xiaobu.controller;

import com.xiaobu.pojo.Category;
import com.xiaobu.service.CategoryService;
import com.xiaobu.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Category")
public class CategoryController {

    private CategoryService categoryService;
    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping("/findAllCats")
    @ResponseBody
    public String findAllCats() throws Exception{

        List<Category> allCats = categoryService.findAllCats();
        System.out.println(allCats);
        System.out.println(JsonUtils.getJson(allCats));
        //将我们的对象解析成为json格式
        return JsonUtils.getJson(allCats);

    }

}
