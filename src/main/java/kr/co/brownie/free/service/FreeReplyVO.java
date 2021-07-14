package kr.co.brownie.free.service;

import lombok.Data;

@Data
public class FreeReplyVO {
    private String lv;
    private String replySeq;
    private String replyContent;
    private String inDate;
    private String inUserId;
    private String upDate;
    private String upUserId;
    private String boardSeq;
    private String headReplySeq;
    private String status;
    private String lolId;
    private String nickName;
}
