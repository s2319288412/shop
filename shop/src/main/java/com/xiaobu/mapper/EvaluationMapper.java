package com.xiaobu.mapper;

import com.xiaobu.pojo.Evaluation;
import com.xiaobu.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluationMapper {
    @Insert("insert into evaluation(uid,pid,evaluate) values(#{uid},#{pid},#{evaluate})")
    Integer saveEvaluation(@Param("pid") String pid,@Param("uid") String uid,@Param("evaluate") String evaluate);

    //查询评价信息
    @Select("select * from evaluation where pid=#{pid}")
    @Results({
            @Result(id=true,property ="eid",column = "eid"),
            @Result(property = "user",column = "uid",javaType = User.class,one=@One(select = "com.xiaobu.mapper.UserMapper.findById")),
            @Result(property = "evaluate",column = "evaluate")
    })
    List<Evaluation> findEvaluationById(@Param("pid") String pid);

}
