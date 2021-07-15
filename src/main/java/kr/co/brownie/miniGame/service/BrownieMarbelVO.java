package kr.co.brownie.miniGame.service;

import lombok.Data;

import java.util.Date;

@Data
public class BrownieMarbelVO {
	private String userId;
	private int round;
	private int hp;
	private int recentHp;
	private String item;
	private int position;
	private int point;
	private String recentMap;
	private String quest;
    private int dicetimes;
}
