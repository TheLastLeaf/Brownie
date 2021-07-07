package kr.co.brownie.user.service;

import lombok.Data;

import java.util.Date;

@Data
public class UserVO {
	private String userId;
    private String lolId;
    private String nickName;
    private int blackStack;
    private String status;
    private String inDate;
    private String modDate;
    private String inUserId;
    private String upUserId;
    private String userPosition;

    private String userLevel;
    private String permitLevel;
}
