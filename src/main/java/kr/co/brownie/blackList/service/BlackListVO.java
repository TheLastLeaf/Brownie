package kr.co.brownie.blackList.service;

import lombok.Data;

import java.util.Date;

@Data
public class BlackListVO {
    private String bListSeq;
    private String userId;
    private String result;
    private String inDate;
    private String inUserId;
    private String upDate;
    private String upUserId;
    private String reasonSeq;
    private String reasonKind1;
    private String status;
    private Integer bUserSeq;
    private Date endDate;

}
