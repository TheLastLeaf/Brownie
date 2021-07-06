package kr.co.brownie.gallery.service;

import java.util.Date;

import lombok.Data;

@Data
public class FileVO {
	private int fileSeq;
    private int subSeq;
    private String filePath;
    private String originalName;
    private String saveName;
    private Date inDate;
    private String inUserId;
    private Date upDate;
    private String upUserId;
}
