package kr.co.brownie.common.service;

import java.util.List;

public interface CommonService {
    String USER_AGENT = "Mozilla/5.0";

    List<LeagueCalendar> leagueCalendarList();

    List<LeagueCalendar> teamInfoList();
}
