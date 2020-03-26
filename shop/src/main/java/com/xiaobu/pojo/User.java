package com.xiaobu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String uid;//用户编号
    private String username;//用户账户
    private String password;//用户密码
    private String name;//用户昵称
    private String email;//用户邮箱
    private String telephone;//用户手机
    private String birthday;//用户生日
    private String sex;//用户性别
    private int state;//用户状态  1：激活  0：未激活
    private String code;//激活码


}
