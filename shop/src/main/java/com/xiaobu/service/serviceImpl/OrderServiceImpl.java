package com.xiaobu.service.serviceImpl;

import com.github.pagehelper.PageHelper;
import com.xiaobu.mapper.OrderMapper;
import com.xiaobu.pojo.Order;
import com.xiaobu.pojo.OrderItem;
import com.xiaobu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional(rollbackFor = Exception.class)
public class OrderServiceImpl  implements OrderService {

    private OrderMapper orderMapper;
    @Autowired
    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }
    //保存订单
    public void  saveOrder(Order order){
            //保存订单和订单项
            orderMapper.saveOrder(order);//存储订单
            for (OrderItem orderItem : order.getList()) {
                String oid = order.getOid();
                orderMapper.saveOrderItem(orderItem, oid);//存储订单项
            }

    }
    //根据ID查询订单
    public Order findOrderByOid(String oid) throws Exception {
        return orderMapper.findOrderByOid(oid);
    }

    public Integer updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    public List<Order> findOrderList(String uid, Integer page, Integer size) {
        //获取第1页，9条内容，默认查询总数
        PageHelper.startPage(page,size);
        List<Order> list = orderMapper.findOrderList(uid);
        return list;
    }
}
