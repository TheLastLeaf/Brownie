package kr.co.brownie.leagueoflegends.versions.service.impl;

import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsService;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("leagueOfLegendsVersionsService")
public class LeagueOfLegendsVersionsServiceImpl implements LeagueOfLegendsVersionsService {
    @Resource(name = "leagueOfLegendsVersionsMapper")
    LeagueOfLegendsVersionsMapper leagueOfLegendsVersionsMapper;

    @Override
    public LeagueOfLegendsVersionsVO selectRecentlyVersion() {
        return leagueOfLegendsVersionsMapper.selectRecentlyVersion();
    }
}
