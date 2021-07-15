package kr.co.brownie.blackList.service;
import lombok.Data;

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

}
