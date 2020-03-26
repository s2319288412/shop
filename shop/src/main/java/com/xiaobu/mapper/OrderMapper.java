package com.xiaobu.mapper;

import com.xiaobu.pojo.Order;
import com.xiaobu.pojo.OrderItem;
import com.xiaobu.pojo.Product;
import com.xiaobu.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    //保存订单
    @Insert("insert into orders(oid,ordertime,total,state,address,name,telephone,uid) values(#{order.oid},#{order.ordertime},#{order.total},${order.state},#{order.address},#{order.name},#{order.telephone},#{order.user.uid});")
    Integer saveOrder(@Param("order") Order order) ;
    //保存订单项
    @Insert("insert into orderitem(itemID,quantity,total,pid,oid) values(#{orderItem.itemID},#{orderItem.quantity},#{orderItem.total},#{orderItem.product.pid},#{oid});")
    Integer saveOrderItem(@Param("orderItem") OrderItem orderItem, @Param("oid") String oid);
    //根据OID查询订单
    @Select("select * from orders where oid=#{oid}")
    @Results({
             //@Result里的column 对应数据库   property对应实体类
            @Result(id = true, column = "oid", property = "oid"),
            @Result(column = "ordertime",property = "ordertime"),
            @Result(column = "ordertime",property = "ordertime"),
            @Result(column = "total",property = "total"),
            @Result(column = "state",property = "state"),
            @Result(column = "address",property = "address"),
            @Result(column = "name",property = "name"),
            @Result(column = "telephone",property = "telephone"),
            @Result(column = "uid",property = "user",javaType = User.class,one = @One(select = "com.xiaobu.mapper.UserMapper.findById")),
            @Result(column = "oid",property = "list",javaType = java.util.List.class,many = @Many(select = "com.xiaobu.mapper.OrderMapper.findOrderItemById"))
    })
    Order findOrderByOid(@Param("oid") String oid);

    //根据ID查询订单项
    @Select("select * from orderitem where oid=#{oid}")
    @Results({
            //@Result里的column 对应数据库   property对应实体类
            @Result(id=true,column = "itemID",property = "itemID"),
            @Result(column = "quantity",property = "quantity"),
            @Result(column = "total",property = "total"),
            @Result(column = "pid",property = "product",javaType = Product.class,one = @One(select = "com.xiaobu.mapper.ProductMapper.findProductByPid")),
    })
    List<OrderItem> findOrderItemById(@Param("oid") String oid);

    //更新订单
    @Update("update orders set state=#{order.state},address=#{order.address},name=#{order.name},telephone=#{order.telephone} where oid=#{order.oid}")
    Integer updateOrder(@Param("order") Order order);

    //根据uid查询所有订单
    @Select("select * from orders where uid=#{uid}")
    @Results({
            //@Result里的column 对应数据库   property对应实体类
            @Result(id = true, column = "oid", property = "oid"),
            @Result(column = "ordertime",property = "ordertime"),
            @Result(column = "ordertime",property = "ordertime"),
            @Result(column = "total",property = "total"),
            @Result(column = "state",property = "state"),
            @Result(column = "address",property = "address"),
            @Result(column = "name",property = "name"),
            @Result(column = "telephone",property = "telephone"),
            @Result(column = "uid",property = "user",javaType = User.class,one = @One(select = "com.xiaobu.mapper.UserMapper.findById")),
            @Result(column = "oid",property = "list",javaType = java.util.List.class,many = @Many(select = "com.xiaobu.mapper.OrderMapper.findOrderItemById"))
    })
    List<Order> findOrderList(@Param("uid") String uid);

}
