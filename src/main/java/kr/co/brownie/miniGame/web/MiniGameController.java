package kr.co.brownie.miniGame.web;

import kr.co.brownie.miniGame.service.BrownieMarbelInfoService;
import kr.co.brownie.miniGame.service.BrownieMarbelInfoVO;
import kr.co.brownie.miniGame.service.BrownieMarbelLogVO;
import kr.co.brownie.miniGame.service.BrownieMarbelVO;
import kr.co.brownie.user.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/miniGame")
public class MiniGameController {
    @Resource(name = "brownieMarbelInfoService")
    BrownieMarbelInfoService miniGameService;
    
    @Resource(name = "userService")
    UserService userService;

	/*@GetMapping(path={"", "/blueMarvel"})
	public String brownieMain(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		//정보 로드하기
		String id = (String) session.getAttribute("id");
		id = "1797573825";
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
		model.addAttribute("logs",logs);
		
		//DB에 있는 맵 가공 추출
		
		HashMap<String, Object> passmap = transMap(player);
		//DB에 있는 랜드정보 가져오는것.
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
        model.addAttribute("infoList",brownieMarbelInfo);
        //
        
		return "miniGame/blueMarvel";
	}*/


    @GetMapping(path = {"", "/blueMarvel"})
    public String brownieMain(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
        //정보 로드하기
        //String id = (String) session.getAttribute("id");
        String id = "1797573825";
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
        HashMap<String, Object> param = new HashMap<>();

        //처음 생성할때
        if (player == null) {
            System.out.println("플레이어 데이터 생성");
            String quest = "race[x],beginer[x],barter[x],riddle[x],tothemoon[x],bet[x],dice[x]";
            String recentMap = addMap();

            param.put("userId", id);
            param.put("recentMap", recentMap);
            param.put("quest", quest);

            //플레이어 정보삽입
            int cnt = this.miniGameService.insertPlayer(param);
            if (cnt == 1) {
                System.out.println("데이터 삽입 성공");
                player = this.miniGameService.selectPlayer(id);
            }
        }
        
        
        System.out.println("player:" + player);
        model.addAttribute("player", player);

        int round = player.getRound();
        param.put("userId", id);
        param.put("round", round);

        List<BrownieMarbelLogVO> logs = this.miniGameService.selectLogs(param);
        System.out.println(logs);
        model.addAttribute("logs", logs);

        //DB에 있는 맵 가공 추출
        String recentMap = player.getRecentMap();
        recentMap = recentMap.replace("[", "");
        recentMap = recentMap.replace("]", "");
        String[] str = recentMap.split(", ");
        int[] a = Arrays.asList(str).stream().mapToInt(Integer::parseInt).toArray();

        List<Integer> list = new ArrayList<>();

        for (int n : a) {
            list.add(n);
        }


        List<BrownieMarbelInfoVO> brownieMarbelInfo = new ArrayList<BrownieMarbelInfoVO>();
        List<String> landColor = new ArrayList();
        
        
        for (int n : list) {
            brownieMarbelInfo.add(this.miniGameService.selectInfo(n));
        }
        System.out.println(brownieMarbelInfo);
        
        for (BrownieMarbelInfoVO n : brownieMarbelInfo) {
        	String[] temp = n.getFunction().split(",");
        	landColor.add(temp[2]);
        }
        
        //DB에 있는 랜드정보 가져오는것.
        //List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);

        model.addAttribute("infoList", brownieMarbelInfo); //
        model.addAttribute("landColor", landColor); //

        return "miniGame/blueMarvel";
    }


    @ResponseBody
    @RequestMapping(value = "/ajax.rndmapcreate", method = RequestMethod.POST)
    public Map<String, Object> rndMapCreate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!맵만드는것");
        //String id = (String) session.getAttribute("id");
        String id = "1797573825";

        int position = Integer.parseInt(servletRequest.getParameter("position"));
        int round = Integer.parseInt(servletRequest.getParameter("round"));
        int hp = Integer.parseInt(servletRequest.getParameter("hp"));
        String item = servletRequest.getParameter("item");
        int point = Integer.parseInt(servletRequest.getParameter("point"));
        String quest = servletRequest.getParameter("quest");
        String dicetimes = servletRequest.getParameter("dicetimes");
        int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));

        //String recentMap = addMap();
        //ㅈ됬을때 쓸것 (비상 프로토콜)
        List<Integer> list = addMapPoint();
        String recentMap = list.toString();

        System.out.println("recentMap : " + recentMap);
        System.out.println("position : " + position);
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


        int cnt = this.miniGameService.updatePlayer(param);
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
        System.out.println("playerr" + player.getRecentMap());

        //HashMap<String, Object> passmap = transMapPoint(player);
        HashMap<String, Object> passmap = transMapPoint(list);
        //List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
        List<BrownieMarbelInfoVO> brownieMarbelInfo = new ArrayList<BrownieMarbelInfoVO>();

        for (int n : list) {
            brownieMarbelInfo.add(this.miniGameService.selectInfo(n));
        }

        List<String> landColor = new ArrayList();
        
        for (BrownieMarbelInfoVO n : brownieMarbelInfo) {
        	String[] temp = n.getFunction().split(",");
        	landColor.add(temp[2]);
        }
        
        
        System.out.println("맵만들기끝" + cnt);
        System.out.println(brownieMarbelInfo);
        
        map.put("landColor", landColor);
        map.put("info", brownieMarbelInfo);
        
        return map;
    }
	
	
	/*@ResponseBody
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
		String quest = servletRequest.getParameter("quest");
		String dicetimes = servletRequest.getParameter("dicetimes");
		int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
		
		String recentMap = addMap();
		//ㅈ됬을때 쓸것 (비상 프로토콜)
		
		System.out.println("recentMap : "+recentMap);
		System.out.println("position : "+position);
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
		
		
		int cnt = this.miniGameService.updatePlayer(param);
		BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
		System.out.println("playerr"+player.getRecentMap());
		
		HashMap<String, Object> passmap = transMap(player);
		List<BrownieMarbelInfoVO> brownieMarbelInfo = this.miniGameService.getBrownieMarbelList(passmap);
		System.out.println("맵만들기끝"+cnt);
		System.out.println(brownieMarbelInfo);
		return brownieMarbelInfo;
	}*/

    @ResponseBody
    @RequestMapping(value = "/ajax.autorenew", method = RequestMethod.POST)
    public int autoRenew(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!저장");
        //String id = (String) session.getAttribute("id");
        String id = "1797573825";

        int position = Integer.parseInt(servletRequest.getParameter("position"));
        int round = Integer.parseInt(servletRequest.getParameter("round"));
        int hp = Integer.parseInt(servletRequest.getParameter("hp"));
        String item = servletRequest.getParameter("item");
        String recentMap = servletRequest.getParameter("recentMap");
        String quest = servletRequest.getParameter("quest");
        String dicetimes = servletRequest.getParameter("dicetimes");
        int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));

        HashMap<String, Object> param = new HashMap<>();
        param.put("position", position);
        param.put("round", round);
        param.put("hp", hp);
        param.put("item", item);
        param.put("recentMap", recentMap);
        param.put("quest", quest);
        param.put("dicetimes", dicetimes);
        param.put("recentHp", recentHp);
        param.put("userId", id);

        System.out.println("paramrecent2 : " + recentMap);

        int cnt = this.miniGameService.updatePlayer(param);

        return cnt;
    }


    @ResponseBody
    @RequestMapping(value = "/ajax.effectact", method = RequestMethod.POST)
    public Map<String, Object> effectAct(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!효과재생");
        String id = "1797573825";
        
        int UserPosition = Integer.parseInt(servletRequest.getParameter("UserPosition"));
        int diceNum = Integer.parseInt(servletRequest.getParameter("diceNum"));
        System.out.println("UserPosition" + UserPosition);


        int ObjPosition = Integer.parseInt(servletRequest.getParameter("ObjPosition"));
        System.out.println("ObjPosition:"+ObjPosition);
        BrownieMarbelInfoVO obj = this.miniGameService.selectInfo(ObjPosition);
        String objName = obj.getName();
        String objDegree = obj.getDegree();
        String objKind = obj.getKind();
        System.out.println("objNum : " + ObjPosition);
        System.out.println("obj : " + obj.getImgName());
        
        int round = this.miniGameService.selectPlayer(id).getRound();
        
        //변수저장
        HashMap<String, Object> param = new HashMap<String, Object>();

        int pointNum = 0;
        String[] str = (obj.getFunction()).split(",");

        pointNum = Integer.parseInt(str[0]);

        param.put("point", pointNum);
        param.put("userId", id);

        System.out.println(param);

        int cntSavePoint = 0;
        if (objDegree.equals("point")) {
            if (objKind.equals("site")) {
                //포인트 저장 쿼리
                cntSavePoint = this.miniGameService.modifyBPoint(param);
            } else {
                cntSavePoint = this.miniGameService.modifyGamePoint(param);
            }
        }

        int cntSaveLog = 0;
        
        if (cntSavePoint == 1) {
            param.put("object", objName);
            param.put("act", "습득");
            param.put("userId", id);
            param.put("result", str[1] + objName);
            param.put("dicenum", diceNum);
            param.put("round", round);
            
            System.out.println("param : " + param);
            cntSaveLog = this.miniGameService.insertLog(param);
        }
        
        List<BrownieMarbelLogVO> logs = this.miniGameService.selectLogs(param);
        
        String log = "";
        
        for (BrownieMarbelLogVO vo : logs) {
        	log += "<p class='logWrite'><i class='far fa-clock'></i> "+vo.getTime() + "(주사위눈 : "+vo.getDicenum()+") ("+vo.getResult()+")<br>"+vo.getRound()+"-"+vo.getLogSeq()+". "+vo.getUserId()+"은(는) "+vo.getObject()+"을(를) "+vo.getAct()+"했다.</p>";
		}
        
        
        map.put("log",log);
        map.put("player",this.miniGameService.selectPlayer(id)); 
        
        System.out.println("player"+this.miniGameService.selectPlayer(id));
        
        try {
        	map.put("site",this.userService.userOneSelect(id)); 
        	System.out.println(this.userService.userOneSelect(id));
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        
        return map;
    }

    
    
    public String addMap() {
        int dbSize = 68;
        Set<Integer> set = new HashSet<Integer>();
        while (set.size() < 15) {
            Double d = Math.random() * dbSize + 1;
            set.add(d.intValue());
        }

        List<Integer> randomNum = new ArrayList<>(set);

        Collections.shuffle(randomNum);
        Collections.shuffle(randomNum);

        String array = randomNum.toString();

        return array;
    }

    public List<Integer> addMapPoint() {
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 0; i < 15; i++) {
            int ins = 0;
            int d = (int) (Math.random() * 101);
            if (94 <= d && d <= 96) {
                ins = 46;
            } else if (0 <= d && d <= 25) {
                ins = 38;
            } else if (26 <= d && d <= 50) {
                ins = 42;
            } else if (51 <= d && d <= 60) {
                ins = 39;
            } else if (61 <= d && d <= 75) {
                ins = 47;
            } else if (76 <= d && d <= 80) {
                ins = 40;
            } else if (81 <= d && d <= 85) {
                ins = 44;
            } else if (86 <= d && d <= 90) {
                ins = 43;
            } else if (91 <= d && d <= 93) {
                ins = 41;
            } else if (97 <= d && d <= 100) {
                ins = 45;
            }
            list.add(ins);
        }

        Collections.shuffle(list);
        Collections.shuffle(list);
        Collections.shuffle(list);

        if (list.contains(47)) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i) == 47) {
                    int ins = 0;
                    int d = (int) (Math.random() * 101);
                    if (d == 100) {
                        ins = 68;
                    } else if (0 <= d && d <= 55) {
                        ins = 61;
                    } else if (56 <= d && d <= 70) {
                        ins = 62;
                    } else if (71 <= d && d <= 80) {
                        ins = 67;
                    } else if (81 <= d && d <= 87) {
                        ins = 64;
                    } else if (88 <= d && d <= 93) {
                        ins = 66;
                    } else if (94 <= d && d <= 96) {
                        ins = 65;
                    } else if (97 <= d && d <= 99) {
                        ins = 63;
                    }
                    list.set(i, ins);
                }
            }
        }

        return list;
    }


    public HashMap<String, Object> transMap(BrownieMarbelVO player) {
        //DB에 있는 맵 가공 추출
        String recentMap = player.getRecentMap();

        System.out.println("transMap :" + recentMap);
        recentMap = recentMap.replace("[", "");
        recentMap = recentMap.replace("]", "");
        String[] str = recentMap.split(", ");
        int[] a = Arrays.asList(str).stream().mapToInt(Integer::parseInt).toArray();
        List<Integer> randomNum = new ArrayList<>();


        for (int n : a) {
            randomNum.add(n);
        }

        System.out.println("trans" + randomNum);

        HashMap<String, Object> passmap = new HashMap<String, Object>();
        passmap.put("randomNum", randomNum);

        return passmap;
    }

    public HashMap<String, Object> transMapPoint(List<Integer> list) {
        //DB에 있는 맵 가공 추출

        HashMap<String, Object> passmap = new HashMap<String, Object>();
        passmap.put("randomNum", list);

        return passmap;
    }

}
