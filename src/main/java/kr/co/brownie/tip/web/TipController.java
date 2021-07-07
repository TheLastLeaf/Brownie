package kr.co.brownie.tip.web;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsService;
import kr.co.brownie.tip.service.TipService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
    public String tipList(HttpServletRequest httpServletRequest, Model model) {
        String champion = httpServletRequest.getParameter("champion") == null ? "" : httpServletRequest.getParameter("champion");
        int currentPageNumber;
        try {
            currentPageNumber = Math.max(Integer.parseInt(httpServletRequest.getParameter("currentPage")), 1);
        } catch (NullPointerException | NumberFormatException e) {
            currentPageNumber = 1;
        }

        model.addAttribute("leagueOfLegendsChampionsVOList",
                leagueOfLegendsChampionsService.selectRecentlyChampionsList());
        model.addAttribute("tipPagingVO", tipService.selectTipList(champion, currentPageNumber));

        return "tip/list";
    }

    @GetMapping("/details/{board_seq}")
    public String details_post_default(@PathVariable String board_seq) {
        int seq = Integer.parseInt(board_seq);
        return "tip/details"; // 기본화면
    }
}
