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

    @GetMapping(path = {"", "/blueMarvel"})
    public String brownieMain(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
        //정보 로드하기
        String id = (String) session.getAttribute("id");
        if(id==null) {
        	return null;
        }
        
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
        HashMap<String, Object> param = new HashMap<>();
        List<Integer> list = new ArrayList<Integer>();
        
        //처음 생성할때 data
        if (player == null) {
            System.out.println("플레이어 데이터 생성");
            String quest = "beginer[x]";
            list = addMap(list,true);
            String recentMap = list.toString();

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
<<<<<<< Updated upstream


=======
        
        //아이템목록
        String[] items = player.getItem().split(",");
        model.addAttribute("items", items);
        
>>>>>>> Stashed changes
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

        List<Integer> colorList = new ArrayList<>();

        for (int n : a) {
        	colorList.add(n);
        }


        List<BrownieMarbelInfoVO> brownieMarbelInfo = new ArrayList<BrownieMarbelInfoVO>();
        List<String> landColor = new ArrayList();
<<<<<<< Updated upstream


        for (int n : list) {
=======
        
        
        for (int n : colorList) {
>>>>>>> Stashed changes
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
        String id = (String) session.getAttribute("id");

        int position = Integer.parseInt(servletRequest.getParameter("position"));
        int round = Integer.parseInt(servletRequest.getParameter("round"));
        int hp = Integer.parseInt(servletRequest.getParameter("hp"));
        String item = servletRequest.getParameter("item");
        int point = Integer.parseInt(servletRequest.getParameter("point"));
        String quest = servletRequest.getParameter("quest");
        String dicetimes = servletRequest.getParameter("dicetimes");
        int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
<<<<<<< Updated upstream

        List<Integer> list = addMapPoint();
=======
        
        List<Integer> list = new ArrayList<>();
        list = addMap(list, true);
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes

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

    @ResponseBody
    @RequestMapping(value = "/ajax.autorenew", method = RequestMethod.POST)
    public int autoRenew(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!저장");
        String id = (String) session.getAttribute("id");

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
    @RequestMapping(value = "/ajax.deletelog", method = RequestMethod.POST)
    public int deleteLog(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");

        int cnt = 0;
        cnt = this.miniGameService.deleteLog(id);
        System.out.println("deleteCnt : " + cnt);
        return cnt;
    }

    @ResponseBody
    @RequestMapping(value = "/ajax.selectmarbelinfo", method = RequestMethod.POST)
    public BrownieMarbelInfoVO selectMarbelInfo(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
<<<<<<< Updated upstream
        String id = (String) session.getAttribute("id");


        int seq = Integer.parseInt(servletRequest.getParameter("landNum"));

        System.out.println("seq : " + seq);

        BrownieMarbelInfoVO info = this.miniGameService.selectInfo(seq);
        System.out.println("seq2 : " + info);

        return info;
=======
    	String id = (String) session.getAttribute("id");
    	
    	int seq = Integer.parseInt(servletRequest.getParameter("landNum"));
    	
    	System.out.println("seq : "+seq);
    	
    	BrownieMarbelInfoVO info = this.miniGameService.selectInfo(seq);
    	System.out.println("seq2 : "+info);
    	
    	return info;
>>>>>>> Stashed changes
    }

    @ResponseBody
    @RequestMapping(value = "/ajax.effectact", method = RequestMethod.POST)
    public Map<String, Object> effectAct(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!효과재생");
        String id = (String) session.getAttribute("id");
<<<<<<< Updated upstream

=======
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
        
        
>>>>>>> Stashed changes
        //유저의 위치정보
        int UserPosition = Integer.parseInt(servletRequest.getParameter("UserPosition"));
        //유저의 주사위 숫자
        int diceNum = Integer.parseInt(servletRequest.getParameter("diceNum"));

        //밟은 땅의 seq 및 오브젝트 정보
        int ObjPosition = Integer.parseInt(servletRequest.getParameter("ObjPosition"));
        BrownieMarbelInfoVO obj = this.miniGameService.selectInfo(ObjPosition);
        String objName = obj.getName();
        String objDegree = obj.getDegree();
        String objKind = obj.getKind();
<<<<<<< Updated upstream


=======
        
        //아이템목록
        String[] items = player.getItem().split(",");
        model.addAttribute("items", items);
        
>>>>>>> Stashed changes
        int round = this.miniGameService.selectPlayer(id).getRound();
        map.put("obj", obj);
        //변수저장
        HashMap<String, Object> param = new HashMap<String, Object>();
        String[] str = (obj.getFunction()).split(",");

<<<<<<< Updated upstream
        //밟은랜드가 point 일 경우
        int cntSavePoint = 0;

        if (objDegree.equals("point") || objDegree.equals("item")) {
            int pointNum = 0;

            pointNum = Integer.parseInt(str[0]);

            param.put("point", pointNum);
            param.put("userId", id);
=======
        
        String act = "";
        //밟은랜드가 good 일 경우
        int saveCnt = 0;
        
        if(objDegree.equals("start")) {
        	
        } else if (objDegree.equals("bad")) {
        	
        } else if (objDegree.equals("ne")) {
        	
        } else if (objDegree.equals("good")) {
        	int pointNum = 0;
        	pointNum = Integer.parseInt(str[0]);
        	param.put("point", pointNum);
        	param.put("userId", id);
        	act = "습득";
>>>>>>> Stashed changes
            if (objKind.equals("site")) {
            	saveCnt = this.miniGameService.modifyBPoint(param);
            } else if (objKind.equals("game")) {
<<<<<<< Updated upstream
                cntSavePoint = this.miniGameService.modifyGamePoint(param);
            } else {
                cntSavePoint = this.miniGameService.modifyGamePoint(param);
=======
            	saveCnt = this.miniGameService.modifyGamePoint(param);
            } else if (objKind.equals("luxury")){
            	saveCnt = this.miniGameService.modifyGamePoint(param);
            } else if (objKind.equals("food")){
            	
>>>>>>> Stashed changes
            }
        }


        //로그 저장
        int cntSaveLog = 0;
<<<<<<< Updated upstream

        if (cntSavePoint == 1) {
=======
        
        if (saveCnt == 1) {
>>>>>>> Stashed changes
            param.put("object", objName);
            param.put("act", act);
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
<<<<<<< Updated upstream
            log += "<p class='logWrite'><i class='far fa-clock'></i> " + vo.getTime() + "(주사위눈 : " + vo.getDicenum() + ") (" + vo.getResult() + ")<br>" + vo.getRound() + "-" + vo.getLogSeq() + ". " + vo.getUserId() + "은(는) " + vo.getObject() + "을(를) " + vo.getAct() + "했다.</p>";
        }


        map.put("log", log);
        map.put("player", this.miniGameService.selectPlayer(id));

        System.out.println("player" + this.miniGameService.selectPlayer(id));

        map.put("site", this.userService.userOneSelect(id));
        System.out.println(this.userService.userOneSelect(id));


        return map;
    }


    public String addMap() {
        int[] food = {52, 53, 54, 55, 56, 57};
        int[] luxury = {61, 62, 63, 64, 65, 66, 67, 68};


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

    //포인트맵
    public List<Integer> addMapPoint() {
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 0; i < 15; i++) {
=======
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

    
    
    public List<Integer> addMap(List<Integer> list,boolean bool) {
    	for (int i = 0; i < 15; i++) {
>>>>>>> Stashed changes
            int ins = 0;
            int d = (int) (Math.random() * 101);
            if (0 <= d && d <= 64) {
            	goodMap(list, bool);
            } else if (65 <= d && d <= 79) {
                neMap(list);
            } else if (80 <= d && d <= 97) {
            	badMap(list);
            } else if (98 <= d && d <= 99) {
            	ins = 30;
            } else if (d==100) {
            	ins = 29;
            }
            if(ins!=0) {
            	list.add(ins);
            }
        }
    	
        Collections.shuffle(list);
        Collections.shuffle(list);
        Collections.shuffle(list);

        return list;
    }
    public List<Integer> badMap(List<Integer> list){
        int d = (int) (Math.random() * 11 + 1);
        list.add(d);
    	return list;
    }
    
    public List<Integer> neMap(List<Integer> list){
    	int d = (int) (Math.random() * 101);
    	int ins = 0;
    	if (0 <= d && d <= 34) {
            ins = 12;
        } else if (35 <= d && d <= 54) {
        	ins = 13;
        } else if (55 <= d && d <= 74) {
        	ins = 14;
        } else if (70 <= d && d <= 100) {
        	ins = (int) (Math.random() * 8 + 15);
        } 
    	list.add(ins);
    	return list;
    }
    
    //good
    public List<Integer> goodMap(List<Integer> list,boolean bool){
    	if(bool&&(!list.contains(48))) {
    		list.add(48);
    		return list;
    	}
        int d = (int) (Math.random() * 100);
        if (0 <= d && d <= 69) {
            addMapPoint(list);
        } else if (70 <= d && d <= 100) {
        	addMapFood(list);
        } 
    	return list;
    }
    
    public List<Integer> addMapFood(List<Integer> list){
        int ins = 0;
        int d = (int) (Math.random() * 100);
        if (0 <= d && d <= 29) {
            ins = 24;
        } else if (30 <= d && d <= 59) {
        	ins = 25;
        } else if (60 <= d && d <= 74) {
            ins = 26;
        } else if (75 <= d && d <= 89) {
            ins = 27;
        } else if (90 <= d && d <= 96) {
            ins = 28;
        } else {
        	ins = 23;
        }
        list.add(ins);
    	return list;
    }

    //포인트맵
    public List<Integer> addMapPoint(List<Integer> list) {
        int ins = 0;
        int d = (int) (Math.random() * 101);
        if (0 <= d && d <= 19) {
            ins = 31;
        } else if (20 <= d && d <= 34) {
            ins = 32;
        } else if (35 <= d && d <= 37) {
            ins = 33;
        } else if (38 <= d && d <= 39) {
            ins = 34;
        } else if (40 <= d && d <= 59) {
            ins = 35;
        } else if (60 <= d && d <= 74) {
            ins = 36;
        } else if (75 <= d && d <= 81) {
            ins = 37;
        } else if (82 <= d && d <= 86) {
            ins = 38;
        } else if (87 <= d && d <= 99) {
            ins = 39;
        } else if (90 <= d && d <= 100) {
        	addMapLux(list);
        }
        
        if(ins!=0) {
        	list.add(ins);
        }

        return list;
    }
    public List<Integer> addMapLux(List<Integer> list) {
        int d = (int) (Math.random() * 101);
        int ins = 0;
        if (d == 100) {
            ins = 47;
        } else if (0 <= d && d <= 55) {
            ins = 40;
        } else if (56 <= d && d <= 70) {
            ins = 41;
        } else if (71 <= d && d <= 80) {
            ins = 46;
        } else if (81 <= d && d <= 87) {
            ins = 43;
        } else if (88 <= d && d <= 93) {
            ins = 45;
        } else if (94 <= d && d <= 96) {
            ins = 44;
        } else if (97 <= d && d <= 99) {
            ins = 42;
        }
        //list.set(i, ins);
        list.add(ins);
    	return list;
    }
    
    //이벤튼
    public List<Integer> addMapClover(List<Integer> list) {
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

    //포인트맵 list를 map형태로 변환
    public HashMap<String, Object> transMapPoint(List<Integer> list) {

        HashMap<String, Object> passmap = new HashMap<String, Object>();
        passmap.put("randomNum", list);

        return passmap;
    }

}
