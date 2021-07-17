package kr.co.brownie.teamGame.service;

import lombok.Data;

import java.util.Date;

@Data
public class TeamGameVO {
    private int teamgameSep;
    private String userId;
    private String title;
    private String matchMode;
    private String message;
    private String positionSeq;
    private String status;
    private String usePoint;
    private Date inDate;
    private String inUserId;
    private Date modDate;
    private String upUserId;

    //position
    private String top;
    private String mid;
    private String jun;
    private String bot;
    private String sup;
}
