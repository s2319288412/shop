package com.xiaobu.controller;

import com.github.pagehelper.PageInfo;
import com.xiaobu.pojo.Evaluation;
import com.xiaobu.pojo.Product;
import com.xiaobu.service.EvaluationService;
import com.xiaobu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class ProductController {

    private ProductService productService;
    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
    private EvaluationService evaluationService;
    @Autowired
    public void setEvaluationService(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }

    //分页
   // @RequestMapping("/toProduct_list.do/{cid}/{page}/{size}")
    @RequestMapping("/toProduct_list/{cid}/{page}/{size}")//, @PathVariable("page") int page, @PathVariable("size") int size
    public ModelAndView toProduct_list(@PathVariable("cid") String cid, @PathVariable("page") int page, @PathVariable("size") int size) throws Exception{
       ModelAndView mv=new ModelAndView();
        //调用业务层查询
        List<Product> products = productService.findCategory(cid, page, size);

       // PageInfo就是一个分页Bean
       PageInfo pageInfo=new PageInfo(products);
       mv.addObject("cid",cid);
       mv.addObject("infoCount",pageInfo.getTotal());
       mv.addObject("pageNum", pageInfo.getPageNum());
       mv.addObject("pageSize",pageInfo.getPageSize());
       mv.addObject("pageInfo",pageInfo);
       mv.setViewName("product_list");
        return mv;
    }
    @RequestMapping("/toProduct_info/{pid}")
    public ModelAndView toProduct_info(@PathVariable("pid") String pid ) throws Exception{
        ModelAndView mv=new ModelAndView();
        //调用业务层 查询商品信息
        Product product = productService.findProductByPid(pid);
        //查询评价信息
        List<Evaluation> evaluation = evaluationService.findEvaluationById(pid);
        mv.addObject("product",product);
        mv.addObject("evaluation",evaluation);
        mv.setViewName("product_info");
        return mv;
    }
}
