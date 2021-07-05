package kr.co.brownie.attendance.service;

import lombok.Data;

@Data
public class AttendanceVO {
	private String attendSeq;
	private String checkedDate;
	private String inUser;
	private String inDate;
}
