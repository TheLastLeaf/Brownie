package kr.co.brownie.gallery.service;

import java.util.Date;

public class GalleryVO {
    private int boardSeq;
    private String boardKind;
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

    public GalleryVO(){

    }

    public GalleryVO(int boardSeq, String boardKind, String title, String content, String noticeYn, String status, Date inDate, String inUserId, Date upDate, String upUserId, int fileSeq, int subSeq) {
        this.boardSeq = boardSeq;
        this.boardKind = boardKind;
        this.title = title;
        this.content = content;
        this.noticeYn = noticeYn;
        this.status = status;
        this.inDate = inDate;
        this.inUserId = inUserId;
        this.upDate = upDate;
        this.upUserId = upUserId;
        this.fileSeq = fileSeq;
        this.subSeq = subSeq;
    }

    public int getBoardSeq() {
        return boardSeq;
    }

    public void setBoardSeq(int boardSeq) {
        this.boardSeq = boardSeq;
    }

    public String getBoardKind() {
        return boardKind;
    }

    public void setBoardKind(String boardKind) {
        this.boardKind = boardKind;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getNoticeYn() {
        return noticeYn;
    }

    public void setNoticeYn(String noticeYn) {
        this.noticeYn = noticeYn;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public String getInUserId() {
        return inUserId;
    }

    public void setInUserId(String inUserId) {
        this.inUserId = inUserId;
    }

    public Date getUpDate() {
        return upDate;
    }

    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

    public String getUpUserId() {
        return upUserId;
    }

    public void setUpUserId(String upUserId) {
        this.upUserId = upUserId;
    }

    public int getFileSeq() {
        return fileSeq;
    }

    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
    }

    public int getSubSeq() {
        return subSeq;
    }

    public void setSubSeq(int subSeq) {
        this.subSeq = subSeq;
    }

    @Override
    public String toString() {
        return "GalleryVO{" +
                "boardSeq=" + boardSeq +
                ", boardKind='" + boardKind + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", noticeYn='" + noticeYn + '\'' +
                ", status='" + status + '\'' +
                ", inDate=" + inDate +
                ", inUserId='" + inUserId + '\'' +
                ", upDate=" + upDate +
                ", upUserId='" + upUserId + '\'' +
                ", fileSeq=" + fileSeq +
                ", subSeq=" + subSeq +
                '}';
    }
}
