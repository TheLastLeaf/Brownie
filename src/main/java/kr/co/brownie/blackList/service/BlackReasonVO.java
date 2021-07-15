package kr.co.brownie.blackList.service;

import lombok.Data;

import java.util.Date;

@Data
public class BlackReasonVO {
    private Integer reasonSeq;
    private String reasonKind1;
    private String reasonKind2;
    private Date inDate;
    private Date upDate;
    private String inUserId;
    private String upUserId;
}
