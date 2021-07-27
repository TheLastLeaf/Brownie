package kr.co.brownie.common.service;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TeamInfo {
    private String teamId;
    private String leagueId;
    private String bracket;
    private Integer rank;
    private Integer wins;
    private Integer loses;
    private Integer draws;
    private Integer score;
    private Float winRate;

    private Float kda;
    private Integer kills;
    private Integer deaths;
    private Integer assists;
    private Float firstKillRate;
    private Float firstTowerRate;
    private Float firstBaronRate;

    private String gameCode;
    private String name;
    private String nameAcronym;
    private String nameEng;
    private String nameEngAcronym;
    private String imageUrl;
    private String colorImageUrl;
    private String whiteImageUrl;
    private String blackImageUrl;
}
