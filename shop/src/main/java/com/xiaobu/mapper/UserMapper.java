package com.xiaobu.mapper;

import com.xiaobu.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface UserMapper {
    @Select("select * from user where username=#{username} and password=#{password}")
    User login(User user) throws  Exception;

    @Select("select * from user where username=#{username}")
    User findByUsername(String username) throws Exception;
    //注册用户
    @Insert("insert into user value(#{uid},#{username},#{password},#{name},#{email},#{telephone},#{birthday},#{sex},#{state},#{code})")
    Integer  registerUser(User user) throws Exception;

    //根据id查询用户
    @Select("select * from user where uid=#{uid}")
    User findById(@Param("uid") String uid)throws Exception;
}
