package com.xiaobu.pojo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;



//map 集合
//购物车
public class Cart {
    //购物项集合    商品的pid<===>CartItem
    private Map<String,CartItem> map=new HashMap<String,CartItem>();
    //总计  /积分
    private double total;

    //返回map中的所有的值   用于判断map是否为空
    public Collection<CartItem> getCartItems(){
        return map.values();
    }

    //1.添加购物项到购物车
    //当用户点击添加购物车按钮的时候   可以把商品的pid 和num  传递给服务端的    服务端根据商品的pid查询商品的信息
    //有了product信息  就能查询  及  num、 total
    public void addCartItemToCart(CartItem cartItem){
        //判断是否已经存在  存在数量相加   不存在则直接加入
        //遍历pid是否存在
        String pid=cartItem.getProduct().getPid();

        if(map.containsKey(pid)){
            //存在数量相加
            CartItem Old=map.get(pid);
            //现在的数量+原先的数量
            //赋值到老的里面
            Old.setNum(cartItem.getNum()+Old.getNum());

        }else{
            //不存在的  直接添加
            map.put(pid, cartItem);
        }

    }
    public void addCartItemToCart(String pid){
        //判断是否已经存在  存在数量相加   不存在则直接加入
        //遍历pid是否存在
            //存在数量相加
            CartItem Old=map.get(pid);
            //现在的数量+原先的数量
            //赋值到老的里面
            Old.setNum(Old.getNum()+1);
    }
    public void lessCartItemToCart(String pid){
        //判断是否已经存在  存在数量相加   不存在则直接加入
        //遍历pid是否存在
        //存在数量相加
        CartItem Old=map.get(pid);
        //现在的数量+原先的数量
        //赋值到老的里面
        Old.setNum(Old.getNum()-1);
    }


    //2.移除购物车中的购物项
    public void removeCartItem(String pid){
        map.remove(pid);
    }


    //3.清空购物车
    public void ClearCart(){
        map.clear();;
    }

    public Map<String, CartItem> getMap() {
        return map;
    }


    public void setMap(Map<String, CartItem> map) {
        this.map = map;
    }

    //总计是可以算出来的
    public double getTotal() {
        //总计先清零
        total=0;

        //获取到Map中所有的购物项
        Collection<CartItem> values = map.values();
        //遍历所有的购物项  将所有的小计进行相加
        for (CartItem cartItem : values) {
            total+=cartItem.getSubTotal();
        }
        //返回总计
        return total;
    }


    public void setTotal(double total) {
        this.total = total;
    }


}
