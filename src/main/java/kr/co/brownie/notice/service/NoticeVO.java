package kr.co.brownie.notice.service;

import lombok.Data;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.util.Date;

@Data
public class NoticeVO {
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
    private int fileSeq;
    private int subSeq;
    private int permitLevel;
    private String nickName;

    public String getImgSrc() {
        String src;
        if (content != null) {
            Document document = Jsoup.parse(content);
            src = document.select("img").attr("src");
            if ("".equals(src)) {
                src = "/img/categories-list/cl-1.jpg";
            }
        } else {
            src = "/img/categories-list/cl-1.jpg";
        }
        return src;
    }

    public String getPreview() {
        Document document = Jsoup.parse(content);
        return document.text();
    }
}
