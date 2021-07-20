package kr.co.brownie.admin.service;

public interface AdminService {
    AdminVO UserCnt();

    AdminVO ReportCnt();

    AdminVO BoardCnt();

    AdminVO BlackUserCnt();

    AdminVO todayUser();
}
