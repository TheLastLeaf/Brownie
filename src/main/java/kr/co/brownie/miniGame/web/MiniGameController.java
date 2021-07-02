package kr.co.brownie.miniGame.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import kr.co.brownie.notice.service.NoticeVO;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {
	@Resource(name = "brownieMarbelInfoService")
	BrownieMarbelInfoService miniGameService;

	@GetMapping(path={"", "/blueMarvel"})
	public String brownieMain(Model model) {
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList();
		System.out.println("info" + brownieMarbelInfo);
        model.addAttribute("infoList",brownieMarbelInfo);
		return "miniGame/blueMarvel";
	}
}
