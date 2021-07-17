package kr.co.brownie.exp.service;

import lombok.Data;

@Data
public class ExpVO {
    private String userId;
    private int exp;
    private int userLevel;
    private String inDate;
    private String inUserId;
    private String modDate;
    private String upUserId;
}
