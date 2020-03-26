package com.xiaobu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private String cid;
    private String cname;
    private int cstate; //1 是有效  0是无效
}
