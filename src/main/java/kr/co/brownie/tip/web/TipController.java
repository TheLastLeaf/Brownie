package kr.co.brownie.tip.web;

import kr.co.brownie.leagueoflegends.champions.service.LeagueOfLegendsChampionsService;
import kr.co.brownie.leagueoflegends.versions.service.LeagueOfLegendsVersionsService;
import kr.co.brownie.tip.service.TipService;
import kr.co.brownie.tip.service.TipVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

    @GetMapping("/write")
    public String add(Model model) {
        model.addAttribute("leagueOfLegendsChampionsVOList", leagueOfLegendsChampionsService.selectRecentlyChampionsList());

        return "tip/write";
    }

    @PostMapping("/write")
    public String add_form(HttpServletRequest httpServletRequest) {
        String author = httpServletRequest.getSession().getAttribute("id").toString();
        String champion = httpServletRequest.getParameter("champion");
        String title = httpServletRequest.getParameter("title");
        String content = httpServletRequest.getParameter("content");

        tipService.insert(author, champion, title, content);

        return "redirect:/" + httpServletRequest.getContextPath() + "tip/list";
    }

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
        model.addAttribute("tipPagingVO", tipService.selectList(champion, currentPageNumber));

        System.out.println(tipService.selectList(champion, currentPageNumber));

        return "tip/list";
    }

    @GetMapping("/details/{board_seq}")
    public String details_post_default(@PathVariable String board_seq, Model model) {
        int seq;
        try {
            seq = Integer.parseInt(board_seq);

            TipVO tipVO = tipService.select(seq);
            if (tipVO == null) {
                throw new NullPointerException();
            }
            model.addAttribute("tipVO", tipVO);
        } catch (NullPointerException | NumberFormatException e) {
            return "error/404";
        }
        return "tip/details"; // 기본화면
    }
}
