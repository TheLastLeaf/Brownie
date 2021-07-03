package kr.co.brownie.attendance.service;

public class AttendanceVO {
	private String attendSeq;
	private String checkedDate;
	private String inUser;
	private String inDate;

	public String getAttendSeq() {
		return attendSeq;
	}
	public void setAttendSeq(String attendSeq) {
		this.attendSeq = attendSeq;
	}
	public String getCheckedDate() {
		return checkedDate;
	}
	public void setCheckedDate(String checkedDate) {
		this.checkedDate = checkedDate;
	}
	public String getInUser() {
		return inUser;
	}
	public void setInUser(String inUser) {
		this.inUser = inUser;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public AttendanceVO(String attendSeq, String checkedDate, String inUser, String inDate) {
		super();
		this.attendSeq = attendSeq;
		this.checkedDate = checkedDate;
		this.inUser = inUser;
		this.inDate = inDate;
	}
	@Override
	public String toString() {
		return "AttendanceVO [attendSeq=" + attendSeq + ", checkedDate=" + checkedDate + ", inUser=" + inUser
				+ ", inDate=" + inDate + "]";
	}


}
