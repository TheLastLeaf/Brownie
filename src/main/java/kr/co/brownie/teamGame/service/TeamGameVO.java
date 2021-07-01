package kr.co.brownie.teamGame.service;

import java.util.Date;

public class TeamGameVO {
    private int teamgameSep;
    private String userId;
    private String title;
    private String matchMode;
    private String message;
    private String position;
    private String status;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;

    public TeamGameVO(){

    }

    public TeamGameVO(int teamgameSep, String userId, String title, String matchMode, String message, String position, String status, Date inDate, String inUserId, Date upDate, String upUserId) {
        this.teamgameSep = teamgameSep;
        this.userId = userId;
        this.title = title;
        this.matchMode = matchMode;
        this.message = message;
        this.position = position;
        this.status = status;
        this.inDate = inDate;
        this.inUserId = inUserId;
        this.upDate = upDate;
        this.upUserId = upUserId;
    }

    public int getTeamgameSep() {
        return teamgameSep;
    }

    public void setTeamgameSep(int teamgameSep) {
        this.teamgameSep = teamgameSep;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMatchMode() {
        return matchMode;
    }

    public void setMatchMode(String matchMode) {
        this.matchMode = matchMode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
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

    @Override
    public String toString() {
        return "TeamGameVO{" +
                "teamgameSep=" + teamgameSep +
                ", userId='" + userId + '\'' +
                ", title='" + title + '\'' +
                ", matchMode='" + matchMode + '\'' +
                ", message='" + message + '\'' +
                ", position='" + position + '\'' +
                ", status='" + status + '\'' +
                ", inDate=" + inDate +
                ", inUserId='" + inUserId + '\'' +
                ", upDate=" + upDate +
                ", upUserId='" + upUserId + '\'' +
                '}';
    }
}
