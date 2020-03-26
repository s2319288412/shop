package com.xiaobu.service.serviceImpl;


import com.xiaobu.mapper.EvaluationMapper;
import com.xiaobu.pojo.Evaluation;
import com.xiaobu.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class EvaluationServiceImpl implements EvaluationService {
    private EvaluationMapper evaluationMapper;
    @Autowired
    public void setEvaluationMapper(EvaluationMapper evaluationMapper) {
        this.evaluationMapper = evaluationMapper;
    }
    //保存评价
    public void saveEvaluation(String pid, String uid, String evaluate){
        evaluationMapper.saveEvaluation(pid,uid,evaluate);
    }

    public List<Evaluation> findEvaluationById(String pid) {
        return evaluationMapper.findEvaluationById(pid);
    }
}
