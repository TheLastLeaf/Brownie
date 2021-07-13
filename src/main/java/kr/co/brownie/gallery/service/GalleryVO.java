package kr.co.brownie.gallery.service;

import java.util.Date;

import lombok.Data;

@Data
public class GalleryVO {

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
    private String fileSeq;
    private int subSeq;
    private int love;
    private int hate;
}
