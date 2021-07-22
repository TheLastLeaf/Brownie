package kr.co.brownie.board.service;

import lombok.Data;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class BoardVO {
    //BROWNIE_BOARD
    private Integer boardSeq;
    private String boardKind;
    private String boardCategory;
    private String title;
    private String content;
    private String noticeYn;
    private String boardStatus;
    private Date boardInDate;
    private String boardInUserId;
    private Date boardUpDate;
    private String boardUpUserId;
    private Integer fileSeq;
    private Integer subSeq;

    //BROWNIE_USER
    private String userId;
    private String lolId;
    private String nickName;
    private Integer blackStack;
    private String userStatus;
    private Date userInDate;
    private Date userUpDate;
    private String userInUserId;
    private String userUpUserId;
    private String userPosition;
    private Integer browniePoint;
    private String image;

    //BROWNIE_BOARD_REPLY
    private Integer replyCnt;

    //BROWNIE_BOARD_HIT
    private Integer hitCnt;

    //BROWNIE_BOARD_LIKE
    private String likeKind;
    private Integer likeCnt;
    private Integer unlikeCnt;

    public String getImgSrc() {
        if (content == null || "".equals(Jsoup.parse(content).select("img").attr("src"))) {
            if (boardKind.equalsIgnoreCase("TIP")) {
                return "https://ddragon.leagueoflegends.com/cdn/11.14.1/img/champion/" + Character.toUpperCase(boardCategory.charAt(0)) + boardCategory.substring(1) + ".png";
            }
            return "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg";
        }
        return Jsoup.parse(content).select("img").attr("src");
    }

    public String getPreview() {
        if (content == null) return "";

        Document document = Jsoup.parse(content);
        return document.text();
    }

    public String getBoardInDateToString() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(this.boardInDate);
    }
}
