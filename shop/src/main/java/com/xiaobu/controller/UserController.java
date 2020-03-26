package com.xiaobu.controller;

import com.xiaobu.pojo.User;
import com.xiaobu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
public class UserController {

    private UserService userService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //检测用户名是否存在
    @RequestMapping("/checkUserName")
    @ResponseBody
    public Boolean toVerifyUsername(User user) throws Exception {
        String username=user.getUsername();
        //根据用户名查询管理员(包括status为0的  以防恢复引起bug)
        User checkUser=userService.findByUsername(username);
        if(checkUser==null)
        {
            //返回true则为没有该用户名可以被注册
            return true;
        }else {

            return false;
        }
    }
    //注册
    @RequestMapping("/register")
    public String register(User user,HttpSession session) throws Exception{
        //注册到数据库

        user.setUid(UUID.randomUUID().toString().replace("-",""));
        user.setState(1);
        //System.out.println("注册的用户为："+user.toString());
        //调用业务层
        userService.registerUser(user);
        //存储到session中
        session.setAttribute("loginUser", user);
        return "redirect:/index";

    }
    /*//注册成功之后进行跳转
    @RequestMapping("/registerOK.do")
    public String registerOK(){
        return "redirect:/index.do";
    }*/



  //登录
    @RequestMapping("/login")
    public String login(User User, HttpSession session) throws Exception{
        User loginUser = userService.login(User);
        //如果不为空 则为登录成功
        if(loginUser !=null){
            //存到session中
            session.setAttribute("loginUser", loginUser);
            return "redirect:/index";
        }else{

            return "redirect:/error";
        }

    }
    //注销
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception{
        session.invalidate();
        return "redirect:/index";
    }

}
