package kr.co.brownie.tip.service;

import lombok.Data;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.util.Date;

@Data
public class TipVO {
    private int boardSeq;
    private String boardKind;
    private String boardCategory;
    private String title;
    private String content;
    private String noticeYn;
    private String status;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
    private String lolId;
    private String nickName;
    private int replyCnt;

    public String getImgSrc() {
        if (content == null) return "https://ddragon.leagueoflegends.com/cdn/11.14.1/img/profileicon/984.png";

        Document document = Jsoup.parse(content);
        String src = document.select("img").attr("src");
        if ("".equals(src)) {
            src = "http://ddragon.leagueoflegends.com/cdn/11.14.1/img/champion/" + boardCategory + ".png";
        }
        return src;
    }

    public String getPreview() {
        if (content == null) return "";

        Document document = Jsoup.parse(content);
        return document.text();
    }
}
