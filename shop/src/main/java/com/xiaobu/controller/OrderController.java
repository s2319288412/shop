package com.xiaobu.controller;

import com.github.pagehelper.PageInfo;
import com.xiaobu.pojo.*;
import com.xiaobu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class OrderController {
    private OrderService orderService;
    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    /*@RequestMapping("/toOrderInfo")
    public ModelAndView toOrderInfo() throws Exception{
        ModelAndView mv=new ModelAndView();
        mv.setViewName("user/order_info");
        return mv;
    }*/


    @RequestMapping("/saveOrder")
    public ModelAndView saveOrder(Integer num,HttpSession session, ModelAndView mv)throws Exception{
        //判断是否登录
        User user = (User)session.getAttribute("loginUser");
        if(user==null){
            //为空则去登录
            mv.setViewName("/login");
            return mv;
        }
        //将购物车的信息以订单的信息保存下来
        Cart cart = (Cart)session.getAttribute("cart");//获取购物车
        //创建订单  为订单赋值
        Order order=new Order();
        order.setOid(UUID.randomUUID().toString().replace("-",""));//订单随机Id
        order.setOrdertime(new Date());//当前时间
        order.setTotal(cart.getTotal());//订单总计  购物车获取
        order.setState(1);//状态码   为1
        //address  name  telephone   为空

        //uid
        order.setUser(user);//uid
        //创建订单项   遍历购物项的同时  创建订单项  为订单项赋值
        for (CartItem item: cart.getCartItems()) {
            OrderItem orderItem=new OrderItem();
            orderItem.setItemID(UUID.randomUUID().toString().replace("-",""));
            orderItem.setQuantity(item.getNum());
            orderItem.setTotal(item.getSubTotal());
            orderItem.setProduct(item.getProduct());
            //设置当前的订单项是属于哪个订单的
            orderItem.setOrder(order);
            order.getList().add(orderItem);//将订单项添加到集合中
        }
        //调用业务成去保存订单
        //判断是否插入成功
        orderService.saveOrder(order);

        //清空购物车
        cart.ClearCart();//调用购物车对象  清空购物车
        //将订单放入到Request中
        session.setAttribute("order",order);
        mv.setViewName("/user/order_info");
        return mv;
    }
    //订单支付
    @RequestMapping("/payOrder")
    public ModelAndView payOrder(Order o)throws Exception{
        ModelAndView mv=new ModelAndView();
        //调用业务查询订单信息
        Order order = orderService.findOrderByOid(o.getOid());
        //更新订单信息
        order.setState(2);//1 待付款 2待评价 3完成
        order.setName(o.getName());
        order.setAddress(o.getAddress());
        order.setTelephone(o.getTelephone());
        //调用业务层更新订单信息
        orderService.updateOrder(order);
        mv.setViewName("success");
        return mv;
    }

    //订单列表
    @RequestMapping("/toOrderList/{page}/{size}")
    public ModelAndView toOrderList(@PathVariable("page") Integer page, @PathVariable("size") Integer size, HttpSession session) throws Exception{
        ModelAndView mv=new ModelAndView();
        User user =(User) session.getAttribute("loginUser");
        if(user==null){
            //为空则去登录
            mv.setViewName("/login");
            return mv;
        }
        String uid = user.getUid();
        //调用业务查询订单
        List<Order> orders = orderService.findOrderList(uid, page, size);
        // PageInfo就是一个分页Bean
         PageInfo pageInfo=new PageInfo(orders);
        mv.addObject("infoCount",pageInfo.getTotal());
        mv.addObject("pageNum", pageInfo.getPageNum());
        mv.addObject("pageSize",pageInfo.getPageSize());
        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("user/order_list");
        return mv;
    }
    //订单详情页
    @RequestMapping("/findOrderByOid/{oid}")
    public ModelAndView findOrderByOid(@PathVariable("oid")String oid,HttpSession session) throws Exception {
        ModelAndView mv=new ModelAndView();

        Order order=orderService.findOrderByOid(oid);
        //存到到request中
        session.setAttribute("order", order);
        //转发到/jsp/order_info.jsp
        mv.setViewName("/user/order_info");
        return mv;
    }



}
