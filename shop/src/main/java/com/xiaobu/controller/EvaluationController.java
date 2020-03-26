package com.xiaobu.controller;

import com.xiaobu.pojo.Evaluation;
import com.xiaobu.pojo.Order;
import com.xiaobu.pojo.OrderItem;
import com.xiaobu.pojo.User;
import com.xiaobu.service.EvaluationService;
import com.xiaobu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class EvaluationController {
    private OrderService orderService;
    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }
    private EvaluationService evaluationService;
    @Autowired
    public void setEvaluationService(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }




    @RequestMapping("/evaluate/{oid}")
    public ModelAndView evaluate(@PathVariable("oid")String oid, HttpSession session) throws Exception{
        ModelAndView mv=new ModelAndView();
        User user =(User) session.getAttribute("loginUser");
        if(user==null){
            //为空则去登录
            mv.setViewName("/login");
            return mv;
        }
        //调用业务查询订单信息
        Order order = orderService.findOrderByOid(oid);
        session.setAttribute("order",order);
        mv.setViewName("/user/evaluate");
        return mv;
    }

    @RequestMapping("/evaluateDo/{itemID}/{pid}")
    public String evaluateDo(@PathVariable("itemID") String itemID, @PathVariable("pid")String pid, Evaluation evaluation, HttpSession session) throws Exception {


        User user = (User) session.getAttribute("loginUser");
        if (user == null) {
            return "/login";
        }
        //System.out.println("-----------"+evaluation.toString());

        //获取订单信息
        Order order = (Order) session.getAttribute("order");
        List<OrderItem> orderItems = order.getList();
        if (orderItems.size() > 1) {
            List<OrderItem> list = new ArrayList<OrderItem>();
            for (OrderItem orderItem : orderItems) {
              //  System.out.println("itemID---------" + itemID);
             //   System.out.println("orderItem.getItemID()-----" + orderItem.getItemID());
                if (!orderItem.getItemID().equals(itemID)) {
                    list.add(orderItem);
                }
            }
            order.setList(list);
            //调用业务保存
            evaluationService.saveEvaluation(pid, user.getUid(), evaluation.getEvaluate());

            //重新赋值
            session.setAttribute("order", order);

            return "/user/evaluate";
        }
        else if (orderItems.size() == 1) {

            //调用业务保存
            evaluationService.saveEvaluation(pid, user.getUid(), evaluation.getEvaluate());
            //为空
            //修改订单
            Order order1 = orderService.findOrderByOid(order.getOid());
            order1.setState(3);
            orderService.updateOrder(order1);

            return "redirect:/index";
        }
        return "";
    }
}
