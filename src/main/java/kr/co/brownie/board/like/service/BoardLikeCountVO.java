package kr.co.brownie.board.like.service;

import lombok.Data;

@Data
public class BoardLikeCountVO {
    private Integer boardSeq;
    private Integer likeCnt;
    private Integer unlikeCnt;
}
