package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//评价
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Evaluation {
    private Integer eid;
    private String evaluate;

    private User user;
    private Product product;

}
