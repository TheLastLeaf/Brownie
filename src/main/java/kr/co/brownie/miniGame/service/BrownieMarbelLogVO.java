package kr.co.brownie.miniGame.service;

import lombok.Data;

import java.util.Date;

@Data
public class BrownieMarbelLogVO {
	private String userId;
	private int round;
	private int logSeq;
	private int dicenum;
	private String time;
	private String object;
	private String act;
	private String result;
}
