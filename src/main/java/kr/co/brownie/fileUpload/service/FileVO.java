package kr.co.brownie.fileUpload.service;

import java.util.Date;

import lombok.Data;

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
