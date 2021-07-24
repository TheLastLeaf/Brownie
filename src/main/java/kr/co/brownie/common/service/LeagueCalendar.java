package kr.co.brownie.common.service;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class LeagueCalendar {
    Date date;
    String aTeam;
    String bTeam;
}
