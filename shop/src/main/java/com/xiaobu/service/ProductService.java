package com.xiaobu.service;

import com.xiaobu.pojo.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    //最新商品
    public List<Product> findAllCats() throws Exception;
    //最热商品
    public List<Product> findHots() throws Exception;
    //分类下的所有商品
    public List<Product> findCategory(String cid,int page,int size) throws Exception;
    //根据pid查询商品信息
    public Product findProductByPid(String pid)throws Exception;
}
