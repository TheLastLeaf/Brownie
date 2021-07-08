package kr.co.brownie.blackList.service;
import lombok.Data;

@Data
public class BlackListVO {
	private String reportSeq;
	private String userId;
	private String result;
	private String inDate;
	private String inUserId;
	private String modDate;
	private String upUserId;
	private String blackSeq;

}
