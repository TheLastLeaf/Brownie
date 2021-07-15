package kr.co.brownie.board.like.service;

import lombok.Data;

import java.util.Date;

@Data
public class BoardLikeVO {
    private Integer boardSeq;
    private String kind;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
}
