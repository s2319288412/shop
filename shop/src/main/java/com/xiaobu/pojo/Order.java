package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


//订单
//订单项
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String oid;
    private Date ordertime;
    private double total;
    private int state;//1 待付款 2待评价 3完成
    private String address;
    private String name;
    private String telephone;

    private User user;//uid
    //查询订单的同时获取所有的订单项
    private List<OrderItem> list=new ArrayList<OrderItem>();
}
