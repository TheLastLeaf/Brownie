package kr.co.brownie.chat.service;

import lombok.Data;

import java.util.Date;

@Data
public class ChatVO {
    private Integer chatSeq;
    private String content;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
    private Integer teamGameSep;
}
