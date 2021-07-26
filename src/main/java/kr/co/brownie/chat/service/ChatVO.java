package kr.co.brownie.chat.service;

import lombok.Data;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class ChatVO {
    private Integer chatSeq;
    private String content;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
    private Integer teamGameSep;
    private String nickName;

    public String getChatInDateToString() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(this.inDate);
    }
}
