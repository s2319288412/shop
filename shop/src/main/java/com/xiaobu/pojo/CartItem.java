package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 购物项
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    private  Product product;//携带图片路径     商品名称    价格
    private int num;//商品数量
    private double subTotal;//商品价格总计

    public double getSubTotal() {
        return product.getShop_price()*num;
    }
}
