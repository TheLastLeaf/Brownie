package kr.co.brownie.miniGame.service;

import lombok.Data;

import java.util.Date;

@Data
public class BrownieMarbelInfoVO {
	private int seq;
	private String degree;
	private String kind;
	private String name;
	private String briefExpl;
	private String detailedExpl;
	private String function;
	private String imgName;
}
