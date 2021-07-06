package kr.co.brownie.leagueoflegends.versions.service.impl;

import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("leagueOfLegendsVersionsMapper")
public interface LeagueOfLegendsVersionsMapper {
    LeagueOfLegendsVersionsVO selectRecentlyVersion();
}
