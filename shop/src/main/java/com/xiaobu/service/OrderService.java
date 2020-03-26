package com.xiaobu.service;

import com.xiaobu.pojo.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    //保存订单
    void saveOrder(Order order)throws Exception;

    //根据ID查询订单
    Order findOrderByOid(String oid) throws Exception;

    //更新订单
    Integer updateOrder(Order order);

    //查询订单并分页
   List<Order> findOrderList(String uid,Integer page,Integer size);
}
