package kr.co.brownie.fileUpload.service;

import lombok.Data;

import java.util.Date;

@Data
public class FileVO {
    int fileSeq;
    int subSeq;
    String filePath;
    String originalName;
    String saveName;
    Date inDate;
    String inUserId;
    Date modDate;
    String upUserId;

}
