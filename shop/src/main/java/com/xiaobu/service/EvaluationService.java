package com.xiaobu.service;

import com.xiaobu.pojo.Evaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface EvaluationService {
   //保存评价信息
   void saveEvaluation(String pid,String uid,String evaluate);
   //查询评价信息
   List<Evaluation> findEvaluationById(String pid);
}
