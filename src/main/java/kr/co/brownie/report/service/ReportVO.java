package kr.co.brownie.report.service;

import lombok.Data;

@Data
public class ReportVO {
	private String reportSeq;
	private String content;
	private String reportName;
	private String userId;
	private String inDate;
	private String modDate;
	private String inUserId;
	private String upUserId;
}
