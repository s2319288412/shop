package com.xiaobu.service.serviceImpl;


import com.xiaobu.mapper.UserMapper;
import com.xiaobu.pojo.User;
import com.xiaobu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public void setSysUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }



   public User login(User user) throws Exception {
       return userMapper.login(user);

   }

    public User findByUsername(String username) throws Exception {
        return userMapper.findByUsername(username);
    }
    //注册
    public Integer registerUser(User user) throws Exception {



        return userMapper.registerUser(user);
    }


}
