package kr.co.brownie.leagueoflegends.champions.service.impl;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("leagueOfLegendsChampionsMapper")
public interface LeagueOfLegendsChampionsMapper {
    List<LeagueOfLegendsChampionsVO> selectRecentlyChampionsList(String version);
}
