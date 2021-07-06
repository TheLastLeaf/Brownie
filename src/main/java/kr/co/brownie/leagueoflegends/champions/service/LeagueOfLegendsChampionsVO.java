package kr.co.brownie.leagueoflegends.champions.service;

import lombok.Data;

@Data
public class LeagueOfLegendsChampionsVO {
    private String version;
    private String language;
    private String id;
    private String key;
    private String name;
    private String title;
    private String blurb;
    private int infoAttack;
    private int infoDefense;
    private int infoMagic;
    private int infoDifficulty;
    private String imageFull;
    private String imageSprite;
    private String imageGroup;
    private int imageX;
    private int imageY;
    private int imageW;
    private int imageH;
    private String tags;
    private String partype;
    private int statsHp;
    private int statsHpperlevel;
    private int statsMp;
    private int statsMpperlevel;
    private int statsMovespeed;
    private int statsArmor;
    private int statsArmorperlevel;
    private int statsSpellblock;
    private int statsSpellblockperlevel;
    private int statsAttackrange;
    private int statsHpregen;
    private int statsHpregenperlevel;
    private int statsMpregen;
    private int statsMpregenperlevel;
    private int statsCrit;
    private int statsCritperlevel;
    private int statsAttackdamage;
    private int statsAttackdamageperlevel;
    private int statsAttackspeedperlevel;
    private int statsAttackspeed;
}
