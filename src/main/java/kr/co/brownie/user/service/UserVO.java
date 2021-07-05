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
    private Date inDate;
    private Date modDate;
    private String inUserId;
    private String upUserId;
    private String userPosition;
    
	public UserVO(String userId, String lolId, String nickName, int blackStack, String status, Date inDate, Date modDate, String inUserId,
			String upUserId, String userPosition) {
		this.userId = userId;
		this.lolId = "???";
		this.nickName = "???";
		this.blackStack = 0;
		this.status = "y";
		this.inDate = inDate;
		this.modDate = modDate;
		this.inUserId = inUserId;
		this.upUserId = upUserId;
		this.userPosition = "???";
	}
    
    
}
