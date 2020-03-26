package com.xiaobu.controller;

import com.xiaobu.pojo.Product;
import com.xiaobu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {

    private ProductService productService;
    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("/index")
    public ModelAndView toIndex() throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Product> news = productService.findAllCats();
        List<Product> hots = productService.findHots();
        mv.addObject("News",news);
        mv.addObject("Hots",hots);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/toLogin")
    public ModelAndView toLogin() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login");
        return mv;
    }
    @RequestMapping("/toRegister")
    public ModelAndView toRegister() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("register");
        return mv;
    }
    /*@RequestMapping("/toProduct_list.do")
    public ModelAndView toProduct_list() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("product_list");
        return mv;
    }*/
    ///toProduct_info.do

    @RequestMapping("/toShopCart")
    public ModelAndView toShopCart() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user/shop_cart");
        return mv;
    }


    @RequestMapping("/success")
    public ModelAndView toSuccess() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("success");
        return mv;
    }
    @RequestMapping("/error")
    public ModelAndView toError() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("error");
        return mv;
    }
}
