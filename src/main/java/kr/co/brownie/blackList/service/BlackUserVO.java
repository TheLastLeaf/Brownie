package kr.co.brownie.blackList.service;

import lombok.Data;

import java.util.Date;

@Data
public class BlackUserVO {
    private Integer bUserSeq;
    private Integer bListSeq;
    private String userId;
    private Date endDate;
    private String status;
    private Date inDate;
    private Date upDate;
    private String inUserId;
    private String upUserId;
    private String nickName;
}
