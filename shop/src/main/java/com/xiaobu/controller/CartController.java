package com.xiaobu.controller;


import com.xiaobu.pojo.Cart;
import com.xiaobu.pojo.CartItem;
import com.xiaobu.pojo.Product;
import com.xiaobu.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class CartController {

    private ProductService productService;
    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    //购物车
    @RequestMapping("/shop_cart")
    public ModelAndView toShopCart(ModelAndView mv, HttpSession session){
        Cart cart2 = (Cart)session.getAttribute("cart");//转成cart类型
        if(cart2 ==null){
            //获取不到session
            cart2 =new Cart();
            //存值到session中
            session.setAttribute("cart", cart2);
        }
        mv.setViewName("user/shop_cart");
        return mv;
    }

    //商品添加到购物项
    //购物项添加到购物车
    @RequestMapping("/addCartItemToCart")
    public ModelAndView addCartItemToCart(HttpServletRequest request, ModelAndView mv) throws Exception{
       //从session中获取对象
       Cart cart2 = (Cart)request.getSession().getAttribute("cart");//转成cart类型
       if(cart2 ==null){
           //获取不到session
           cart2 =new Cart();
           //存值到session中
           request.getSession().setAttribute("cart", cart2);
       }
       //获取到session
        //根据表单提交的值product_info
       //获取商品的Pid和num
       String pid = request.getParameter("pid");
       int num = Integer.parseInt(request.getParameter("quantity"));
       System.out.println("商品的Pid:"+pid+" ----num:"+num);
       //查找商品信息
        Product product = productService.findProductByPid(pid);
        //创建购物项
        CartItem cartItem=new CartItem();
        cartItem.setProduct(product);
        cartItem.setNum(num);
        //把购物项加入购物车
        cart2.addCartItemToCart(cartItem);

       /* boolean cartItems = cart.getCartItems();
        System.out.println("cartItems的值为："+cartItems);

        System.out.println("cart:"+cart.toString());*/
       //重新添加到session
        request.getSession().setAttribute("cart", cart2);
        //重定向到购物车
        mv.setViewName("user/shop_cart");
        return mv;
    }
    //移除购物项
    @RequestMapping("/removeCartItem/{pid}")
    public  ModelAndView removeCartItem(@PathVariable("pid") String pid, HttpSession session,ModelAndView mv) throws Exception {

        //获取到购物车
        Cart cart = (Cart)session.getAttribute("cart");
        //调用购物车上的移除购物项方法
        cart.removeCartItem(pid);
        //重新添加到session
        session.setAttribute("cart", cart);
        //重定向
        mv.setViewName("user/shop_cart");
        return mv;
    }
    //添加或者减少
    @RequestMapping("/addCartItemNum/{pid}")
    public ModelAndView addCartItemNum(@PathVariable("pid") String pid ,HttpSession session)throws Exception{
        ModelAndView mv=new ModelAndView();
        //获取到购物车
        Cart cart = (Cart)session.getAttribute("cart");
        cart.addCartItemToCart(pid);
        //重新添加到session
        session.setAttribute("cart", cart);
        //重定向
        mv.setViewName("user/shop_cart");
        return mv;
    }
    //添加或者减少
    @RequestMapping("/lessCartItemNum/{pid}")
    public ModelAndView lessCartItemNum(@PathVariable("pid") String pid ,HttpSession session)throws Exception{
        ModelAndView mv=new ModelAndView();
        //获取到购物车
        Cart cart = (Cart)session.getAttribute("cart");
        cart.lessCartItemToCart(pid);
        //重新添加到session
        session.setAttribute("cart", cart);
        //重定向
        mv.setViewName("user/shop_cart");
        return mv;
    }

}
