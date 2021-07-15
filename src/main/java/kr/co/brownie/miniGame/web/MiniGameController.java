package kr.co.brownie.miniGame.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import kr.co.brownie.miniGame.service.BrownieMarbelLogVO;
import kr.co.brownie.miniGame.service.BrownieMarbelVO;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {
	@Resource(name = "brownieMarbelInfoService")
	BrownieMarbelInfoService miniGameService;

	@GetMapping(path={"", "/blueMarvel"})
	public String brownieMain(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		//정보 로드하기
		//String id = (String) session.getAttribute("id");
		String id = "1797573825";
		BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
		HashMap<String, Object> param = new HashMap<>();
		
		//처음 생성할때
		if (player==null) {
			System.out.println("플레이어 데이터 생성");
			String quest = "race[x],beginer[x],barter[x],riddle[x],tothemoon[x],bet[x],dice[x]";
			String recentMap = addMap();
			
			param.put("userId", id);
			param.put("recentMap", recentMap);
			param.put("quest", quest);
			
			//플레이어 정보삽입
			int cnt = this.miniGameService.insertPlayer(param);
			if(cnt==1) {
				System.out.println("데이터 삽입 성공");
				player = this.miniGameService.selectPlayer(id);
			}
		}
		
		System.out.println("player:"+player);
		model.addAttribute("player",player);
		
		int round = player.getRound();
		param.put("round", round);
		param.put("userId", id);
		
		List<BrownieMarbelLogVO> logs = this.miniGameService.selectLogs(param);
		System.out.println("logs:"+logs);
		
		//DB에 있는 맵 가공 추출
		
		
		HashMap<String, Object> passmap = transMap(player);
		
		//DB에 있는 랜드정보 가져오는것.
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
		
        model.addAttribute("infoList",brownieMarbelInfo);
        //
        
		return "miniGame/blueMarvel";
	}
	
	@ResponseBody
    @RequestMapping(value="/ajax.rndmapcreate", method=RequestMethod.POST)
    public List<BrownieMarbelInfoVO> rndMapCreate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
		System.out.println("!!!!맵만드는것");
		//String id = (String) session.getAttribute("id");
		String id = "1797573825";
		
		int position = Integer.parseInt(servletRequest.getParameter("position"));
		int round = Integer.parseInt(servletRequest.getParameter("round"));
		int hp = Integer.parseInt(servletRequest.getParameter("hp"));
		String item	= servletRequest.getParameter("item");
		int point = Integer.parseInt(servletRequest.getParameter("point"));
		String recentMap = servletRequest.getParameter("recentMap");
		String quest = servletRequest.getParameter("quest");
		String dicetimes = servletRequest.getParameter("dicetimes");
		int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
		
		HashMap<String, Object> param = new HashMap<>();
		System.out.println("position : "+position);
		if(position==0||position==16) {
			recentMap = addMap();
		}
		
		param.put("position", position);
		param.put("round", round);
		param.put("hp", hp);
		param.put("item", item);
		param.put("point", point);
		param.put("recentMap", recentMap);
		param.put("quest", quest);
		param.put("dicetimes", dicetimes);
		param.put("recentHp", recentHp);
		param.put("userId", id);
		
		System.out.println("par : "+param.get("recentMap"));
		
		int cnt = this.miniGameService.updatePlayer(param);
		System.out.println(cnt);
		
		BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
		
		
		HashMap<String, Object> passmap = transMap(player);
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
		
        model.addAttribute("infoList",brownieMarbelInfo);
		model.addAttribute("player",player);
    	System.out.println("통과함");
    	
		return brownieMarbelInfo;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajax.autorenew", method=RequestMethod.POST)
	public int autoRenew(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
		System.out.println("!!!!저장");
		//String id = (String) session.getAttribute("id");
		String id = "1797573825";
		
		int position = Integer.parseInt(servletRequest.getParameter("position"));
		int round = Integer.parseInt(servletRequest.getParameter("round"));
		int hp = Integer.parseInt(servletRequest.getParameter("hp"));
		String item	= servletRequest.getParameter("item");
		int point = Integer.parseInt(servletRequest.getParameter("point"));
		String recentMap = servletRequest.getParameter("recentMap");
		String quest = servletRequest.getParameter("quest");
		String dicetimes = servletRequest.getParameter("dicetimes");
		int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
		
		HashMap<String, Object> param = new HashMap<>();
		
		param.put("position", position);
		param.put("round", round);
		param.put("hp", hp);
		param.put("item", item);
		param.put("point", point);
		param.put("recentMap", recentMap);
		param.put("quest", quest);
		param.put("dicetimes", dicetimes);
		param.put("recentHp", recentHp);
		param.put("userId", id);
		
		System.out.println("paramrecent1 : "+param.get("recentMap"));
		System.out.println("paramrecent2 : "+recentMap);
		
		int cnt = this.miniGameService.updatePlayer(param);
		
		return cnt;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/ajax.effectact", method=RequestMethod.POST)
	public int effectAct(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
		System.out.println("!!!!효과재생");
		String id = "1797573825";
		
		int UserPosition = Integer.parseInt(servletRequest.getParameter("UserPosition"));
		if(UserPosition==0) {
			System.out.println("시작점 상점");
			return 1;
		}
		
		int ObjPosition = Integer.parseInt(servletRequest.getParameter("ObjPosition"));
		BrownieMarbelInfoVO obj = this.miniGameService.selectInfo(ObjPosition);
		System.out.println("UserPosition"+UserPosition);
		System.out.println("objNum"+ObjPosition);
		System.out.println("obj"+obj.getImgName());
		
		return 1;
	}
	
	public String addMap() {
		int dbSize = 59;
		Set<Integer> set = new HashSet<Integer>(); 
		while (set.size() < 15) { 
			Double d = Math.random() * dbSize + 1; 
			set.add(d.intValue()); 
		} 
		
		List<Integer> randomNum = new ArrayList<>(set); 
		
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum); 
		
		
		String array = randomNum.toString();
		
		return array;
	}
	
	public HashMap<String, Object> transMap(BrownieMarbelVO player) {
		//DB에 있는 맵 가공 추출
		String recentMap = player.getRecentMap();
		recentMap = recentMap.replace("[", "");
		recentMap = recentMap.replace("]", "");
		String[] str = recentMap.split(", ");
		int[] a = Arrays.asList(str).stream().mapToInt(Integer::parseInt).toArray();
		List<Integer> randomNum = new ArrayList<>(); 
		
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum); 
		Collections.shuffle(randomNum);
		
		for(int n : a) {
			randomNum.add(n);
		}
		
		HashMap<String, Object> passmap = new HashMap<String, Object>();
		passmap.put("randomNum", randomNum);
		
		return passmap;
	}
	
}
