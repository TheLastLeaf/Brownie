package kr.co.brownie.admin.service.impl;

import kr.co.brownie.admin.service.AdminVO;
import org.springframework.stereotype.Repository;

@Repository("adminMapper")
public interface AdminMapper {
    AdminVO UserCnt();

    AdminVO ReportCnt();

    AdminVO BoardCnt();

    AdminVO BlackUserCnt();

    AdminVO todayUser();

    AdminVO chatCount();
}
