package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    private String itemID;//id
    private int quantity;//数量
    private double total;//总计

    private Product product;//外键   pid
    private Order order;  //oid
}
