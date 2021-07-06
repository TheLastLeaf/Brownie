package kr.co.brownie.tip.web;

import javax.annotation.Resource;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsVO;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsService;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsVO;
import org.springframework.stereotype.Controller;

import kr.co.brownie.tip.service.TipService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/tip")
public class TipController {
    @Resource(name = "tipService")
    TipService tipService;

    @Resource(name = "leagueOfLegendsVersionsService")
    LeagueOfLegendsVersionsService leagueOfLegendsVersionsService;

    @Resource(name = "leagueOfLegendsChampionsService")
    LeagueOfLegendsChampionsService leagueOfLegendsChampionsService;

    @GetMapping({"", "/list"})
    public String tipList(Model model) {
        LeagueOfLegendsVersionsVO leagueOfLegendsVersionsVO = leagueOfLegendsVersionsService.selectRecentlyVersion();
        List<LeagueOfLegendsChampionsVO> leagueOfLegendsChampionsVOList
                = leagueOfLegendsChampionsService.selectRecentlyChampionsList(leagueOfLegendsVersionsVO.getVERSION());

        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsVOList);

        return "tip/list";
    }

    @GetMapping("/details-post-default")
    public String details_post_default() {
        return "tip/details-post-default"; // 기본화면
    }

    @GetMapping("/details-post-gallery")
    public String details_post_gallery() {
        return "tip/details-post-gallery"; // 기본화면
    }

    @GetMapping("/details-post-review")
    public String details_post_review() {
        return "tip/details-post-review"; // 기본화면 
    }

    @GetMapping("/typography")
    public String typography() {
        return "tip/typography"; // 기본화면 
    }
}
