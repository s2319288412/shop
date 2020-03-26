package com.xiaobu.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.xiaobu.mapper.ProductMapper;
import com.xiaobu.pojo.Product;
import com.xiaobu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 业务逻辑层实现
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;


    public void setProductMapper(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }
    //查询最新商品
    public List<Product> findAllCats() throws Exception {
        return productMapper.findNews();
    }

    public List<Product> findHots() throws Exception {
        return productMapper.findHots();
    }

    public List<Product> findCategory(String cid, int page, int size) throws Exception {
        //获取第1页，9条内容，默认查询总数
        PageHelper.startPage(page,size);
        List<Product> list = productMapper.findCategory(cid);

        return list;
    }

    public Product findProductByPid(String pid) throws Exception {
        return productMapper.findProductByPid(pid);
    }
}
