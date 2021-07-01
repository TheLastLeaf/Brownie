package kr.co.brownie.user.service;

import java.util.Date;

public class UserVO {
    private String userId;
    private String lolId;
    private String nickName;
    private int blackStack;
    private String status;
    private Date inDate;
    private Date upDate;
    private String inUserId;
    private String upUserId;

    public UserVO(){

    }

    public UserVO(String userId, String lolId, String nickName, int blackStack, String status, Date inDate, Date upDate, String inUserId, String upUserId) {
        this.userId = userId;
        this.lolId = lolId;
        this.nickName = nickName;
        this.blackStack = blackStack;
        this.status = status;
        this.inDate = inDate;
        this.upDate = upDate;
        this.inUserId = inUserId;
        this.upUserId = upUserId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLolId() {
        return lolId;
    }

    public void setLolId(String lolId) {
        this.lolId = lolId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getBlackStack() {
        return blackStack;
    }

    public void setBlackStack(int blackStack) {
        this.blackStack = blackStack;
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

    public Date getUpDate() {
        return upDate;
    }

    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

    public String getInUserId() {
        return inUserId;
    }

    public void setInUserId(String inUserId) {
        this.inUserId = inUserId;
    }

    public String getUpUserId() {
        return upUserId;
    }

    public void setUpUserId(String upUserId) {
        this.upUserId = upUserId;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "userId='" + userId + '\'' +
                ", lolId='" + lolId + '\'' +
                ", nickName='" + nickName + '\'' +
                ", blackStack=" + blackStack +
                ", status='" + status + '\'' +
                ", inDate=" + inDate +
                ", upDate=" + upDate +
                ", inUserId='" + inUserId + '\'' +
                ", upUserId='" + upUserId + '\'' +
                '}';
    }
}
