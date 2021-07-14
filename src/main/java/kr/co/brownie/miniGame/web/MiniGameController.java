package kr.co.brownie.miniGame.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {
	@Resource(name = "brownieMarbelInfoService")
	BrownieMarbelInfoService miniGameService;

	@GetMapping(path={"", "/blueMarvel"})
	public String brownieMain(Model model) {
		
		//한바뀌 돌았을때 리셋 과정
		//난수 15개 뽑기
		int dbSize = 30;
		Set<Integer> set = new HashSet<Integer>(); 
		while (set.size() < 15) { 
			Double d = Math.random() * dbSize + 1; 
			set.add(d.intValue()); 
		} 
		
		List<Integer> randomNum = new ArrayList<>(set); 
		
		//덱 3번 셔플
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum); 
		
		HashMap<String, Object> passmap = new HashMap<String, Object>();
		passmap.put("randomNum", randomNum);
		
		//DB에 있는 랜드정보 가져오는것.
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
		
		//또 3번 셔플
		Collections.shuffle(brownieMarbelInfo); 
		Collections.shuffle(brownieMarbelInfo); 
		Collections.shuffle(brownieMarbelInfo); 
		
		System.out.println("info" + brownieMarbelInfo);
        model.addAttribute("infoList",brownieMarbelInfo);
        BrownieMarbelInfoVO info = new BrownieMarbelInfoVO();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("name", info.getName());
        map.put("degree", info.getDegree());
        model.addAttribute("map", map);
        //
        
        
		return "miniGame/blueMarvel";
	}
}
