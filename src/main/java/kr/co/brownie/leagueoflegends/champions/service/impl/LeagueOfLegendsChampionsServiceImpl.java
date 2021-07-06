package kr.co.brownie.leagueoflegends.champions.service.impl;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("leagueOfLegendsChampionsService")
public class LeagueOfLegendsChampionsServiceImpl implements LeagueOfLegendsChampionsService {
    @Resource(name = "leagueOfLegendsChampionsMapper")
    LeagueOfLegendsChampionsMapper leagueOfLegendsChampionsMapper;

    @Override
    public List<LeagueOfLegendsChampionsVO> selectRecentlyChampionsList(String version) {
        return leagueOfLegendsChampionsMapper.selectRecentlyChampionsList(version);
    }
}
