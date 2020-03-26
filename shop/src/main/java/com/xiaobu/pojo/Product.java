package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商品实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private String pid;
    private String pname;
    private double market_price;
    private double shop_price;
    private String pimage;
    private Date pdate;
    private int is_hot;
    private String pdesc;
    private int pflag;
    private String cid;
}
