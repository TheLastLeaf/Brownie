package kr.co.brownie.miniGame.service;

import lombok.Data;

@Data
public class BrownieMarbelVO {
    private String userId;
    private String round;
    private int hp;
    private int recentHp;
    private String item;
    private int position;
    private int point;
    private int browniePoint;
    private String recentMap;
    private String quest;
    private int dicetimes;
}
