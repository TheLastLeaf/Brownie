package kr.co.brownie.common.service;

import lombok.Data;

@Data
public class HitVO {
	private int hitSeq;
	private int boardSeq;
	private String ip;
	private String userId;
}
