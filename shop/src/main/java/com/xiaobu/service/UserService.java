package com.xiaobu.service;

import com.xiaobu.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService{
    //登录
    User login(User user) throws Exception;
    //检查用户名
    User findByUsername(String username)throws Exception;
    //注册
    Integer registerUser(User user) throws Exception;
}
