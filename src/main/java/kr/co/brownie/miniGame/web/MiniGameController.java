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
            String quest = "[0, 0, 0]";
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
        
        //아이템목록
        List<BrownieMarbelInfoVO> playerItem = new ArrayList<BrownieMarbelInfoVO>();
        
        String items = player.getItem();
        items = items.replace("[", "");
        items = items.replace("]", "");
        if(!items.equals("")) {
        	System.out.println(1);
        	String[] item = items.split(", ");
	        int[] itemInt = Arrays.asList(item).stream().mapToInt(Integer::parseInt).toArray();
	        
	        for (int n : itemInt) {
	        	playerItem.add(this.miniGameService.selectInfo(n));
	        }
	        model.addAttribute("playerItem", playerItem);
        }
        
        
        System.out.println("player:" + player);
        model.addAttribute("player", player);

        //로그목록
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
        
        
        for (int n : colorList) {
            brownieMarbelInfo.add(this.miniGameService.selectInfo(n));
        }
        
        System.out.println(brownieMarbelInfo);
        
        for (BrownieMarbelInfoVO n : brownieMarbelInfo) {
        	String[] temp = n.getFunction().split(",");
        	landColor.add(temp[2]);
        }
        
        //DB에 있는 랜드정보 가져오는것.
        
        model.addAttribute("infoList", brownieMarbelInfo); //
        model.addAttribute("landColor", landColor); //

        return "miniGame/blueMarvel";
    }


    @ResponseBody
    @RequestMapping(value = "/ajax.rndmapcreate", method = RequestMethod.POST)
    public Map<String, Object> rndMapCreate(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!맵만드는것");
        String id = (String) session.getAttribute("id");
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);

        int position = Integer.parseInt(servletRequest.getParameter("position"));
        int round = Integer.parseInt(servletRequest.getParameter("round"));
        int hp = Integer.parseInt(servletRequest.getParameter("hp"));
        String item = servletRequest.getParameter("item");
        int point = Integer.parseInt(servletRequest.getParameter("point"));
        String quest = player.getQuest();
        int dicetimes = Integer.parseInt(servletRequest.getParameter("dicetimes"));
        int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
        
        HashMap<String, Object> param = new HashMap<>();
        
        
        String questTemp = quest.replace("[", "");
        questTemp = questTemp.replace("]", "");
        String[] quests = questTemp.split(", ");
        
        boolean key = false;
        
        if (quests[0].equals("0")) {
        	key = true;
        }
        
        List<Integer> list = new ArrayList<>();
        List<Integer> questList = new ArrayList<>();
        
        if (quests[1].equals("1")) {
        	list = addMapClover(list);
        	for (String str : quests) {
        		questList.add(Integer.parseInt(str));
        	}
        	questList.set(1, 0);
        	param.put("quest", questList.toString());
        	System.out.println("클로버맨 " + list.toString());
        } else {
        	list = addMap(list, key);
        	param.put("quest", quest);
        }
        
        String recentMap = list.toString();

        System.out.println("recentMap : " + recentMap);
        System.out.println("position : " + position);
        

        param.put("position", position);
        param.put("round", round);
        param.put("hp", hp);
        param.put("item", item);
        param.put("point", point);
        param.put("recentMap", recentMap);
        param.put("dicetimes", dicetimes);
        param.put("recentHp", recentHp);
        param.put("userId", id);

        int cnt = this.miniGameService.updatePlayer(param);

        HashMap<String, Object> passmap = transMapPoint(list);
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
    @RequestMapping(value = "/ajax.deletelog", method = RequestMethod.POST)
    public int deleteLog(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        String id = (String) session.getAttribute("id");
        
    	int cnt = 0;
    	cnt = this.miniGameService.deleteLog(id);
    	System.out.println("deleteCnt : "+cnt);
    	return cnt;
    }
    
    @ResponseBody
    @RequestMapping(value = "/ajax.selectmarbelinfo", method = RequestMethod.POST)
    public BrownieMarbelInfoVO selectMarbelInfo(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
    	String id = (String) session.getAttribute("id");
    	
    	int seq = Integer.parseInt(servletRequest.getParameter("landNum"));
    	
    	System.out.println("seq : "+seq);
    	
    	BrownieMarbelInfoVO info = this.miniGameService.selectInfo(seq);
    	System.out.println("seq2 : "+info);
    	
    	return info;
    }
    
	@ResponseBody
	@RequestMapping(value = "/ajax.effectact", method = RequestMethod.POST)
	public Map<String, Object> effectAct(@RequestParam Map<String, Object> map, Model model, HttpServletRequest response, HttpSession session, HttpServletRequest servletRequest) {
        System.out.println("!!!!효과재생");
        String id = (String) session.getAttribute("id");
        BrownieMarbelVO player = this.miniGameService.selectPlayer(id);
        
        //sql에 넣을 변수 저장
        HashMap<String, Object> param = new HashMap<String, Object>();
        
        //DB 유저 마블정보
        int position = Integer.parseInt(servletRequest.getParameter("UserPosition"));
        int round = Integer.parseInt(servletRequest.getParameter("round"));
        int hp = Integer.parseInt(servletRequest.getParameter("hp"));
        String item = servletRequest.getParameter("item");
        String recentMap = servletRequest.getParameter("recentMap");
        String quest = player.getQuest();
        int dicetimes = Integer.parseInt(servletRequest.getParameter("dicetimes"));
        int recentHp = Integer.parseInt(servletRequest.getParameter("recentHp"));
        int pointG = player.getPoint();
        int pointB = player.getBrowniePoint();

        
        
        String throwResult = servletRequest.getParameter("throw");
        String throwType = servletRequest.getParameter("throwType");
        System.out.println(throwResult);
        System.out.println(throwType);
        //주사위 기회 줄이기
        System.out.println("주사위 횟수 -------------"+dicetimes);
        
        param.put("userId", id);
        param.put("hp", hp);
        param.put("recentHp", recentHp);
        param.put("round", round);
        param.put("item", item);
        param.put("position", position);
        param.put("recentMap", recentMap);
        param.put("quest", quest);
        param.put("dicetimes", dicetimes);
        
        //유저의 주사위 숫자
        int diceNum = Integer.parseInt(servletRequest.getParameter("diceNum"));

        //밟은 땅의 seq 및 오브젝트 정보
        int objSeq = Integer.parseInt(servletRequest.getParameter("ObjPosition"));
        BrownieMarbelInfoVO obj = this.miniGameService.selectInfo(objSeq);
        String objName = obj.getName();
        String objDegree = obj.getDegree();
        String objKind = obj.getKind();
        map.put("obj",obj);
        System.out.println("obj : "+obj);
        //아이템목록
        
        item = item.replace("[", "");
        item = item.replace("]", "");
        
        List<Integer> itemList = new ArrayList<>();
        List<BrownieMarbelInfoVO> itemInfo = new ArrayList<BrownieMarbelInfoVO>();
        
        if(!item.equals("")) {
        	String[] items = item.split(", ");
        
	        
	        for (String n : items) {
	        	itemList.add(Integer.parseInt(n));
	        }
	
	        for (int n : itemList) {
	        	itemInfo.add(this.miniGameService.selectInfo(n));
	        }
	        
	        map.put("items", itemInfo);
        }
        
        //변수저장
        String[] str = (obj.getFunction()).split(",");
        
        String act = "";
        //밟은랜드가 good 일 경우
        int saveCnt = 0;
        
        if(objDegree.equals("start")) {
        	act = "환전";
    		int sum = 0;
    		if(item!="") {
				for (int n : itemList) {
					sum += Integer.parseInt(this.miniGameService.selectInfo(n).getFunction().split(",")[0]);
					System.out.println("환전중"+sum);
				}
    		}
    		System.out.println("총합"+sum);
			objName = sum + " POINT";
			param.put("point", sum);
			param.put("item", "[]");
			this.miniGameService.updatePlayer(param);
        	saveCnt = this.miniGameService.modifyGamePoint(param);
        } else if (objDegree.equals("bad")) {
        	if (objKind.equals("attack")) {
        		if(objSeq==4) {
        			hp -= 1;
        			recentHp += Integer.parseInt(str[0]);
        		} else {
        			recentHp += Integer.parseInt(str[0]);
        		}
        		param.put("hp", hp);
        		param.put("recentHp", recentHp);
            	saveCnt = this.miniGameService.updatePlayer(param);
            	
            } else if (objKind.equals("theif")) {
            	int temp = 0;
            	if(objSeq==5) {
        			temp = pointG / 2;
        			temp -= pointG;
        			
        		} else {
        			
        			temp = Integer.parseInt(str[0]);
        		}
            	
            	if(pointG+temp<0) {
            		temp = 0;
            	}
            	
            	param.put("point", temp);
            	saveCnt = this.miniGameService.modifyGamePoint(param);
            	
            } else if (objKind.equals("both")){
            	int temp = 0;
            	if (objSeq==1) {
        			recentHp += Integer.parseInt(str[0]);
        			temp= -100-pointG;
        			if (pointG<=100) {
        				temp = 0;
        			}
        		} else if (objSeq==6) {
        			recentHp += Integer.parseInt(str[0]);
        			temp = 300-pointG;
        		} else {
        			recentHp += Integer.parseInt(str[0]);
        			temp = -200-pointG;
        			if (pointG<=200) {
        				temp = 0;
        			}
        		}
            	
            	if(recentHp>=hp) {
            		recentHp=hp;
            	}
            	
            	param.put("point", temp);
            	this.miniGameService.modifyGamePoint(param);
            	
            	param.put("hp", hp);
        		param.put("recentHp", recentHp);
            	saveCnt = this.miniGameService.updatePlayer(param);
            } 
        	act = "조우";
        } else if (objDegree.equals("ne")) {
        	if (objSeq==12) {
        		param.put("point", pointG);
        		saveCnt = this.miniGameService.modifyBPoint(param);
        		param.put("point", -pointG);
        		this.miniGameService.modifyGamePoint(param);
        		act = "이용";
        	} else if (objSeq==13) {
        		map.put("doubleD","double");
        	} else if (objSeq==14) {
        		map.put("oneMore","oneMore");
        	} else if (objSeq==15) {
        		if (throwType.equals("all")) {
        			if(add()) {
        				param.put("point", -pointG);
        				this.miniGameService.modifyGamePoint(param);
        				param.put("point", -pointB);
                		saveCnt = this.miniGameService.modifyBPoint(param);
        			} else {
                		param.put("point", pointG);
        				this.miniGameService.modifyGamePoint(param);
        				param.put("point", pointB);
                		saveCnt = this.miniGameService.modifyBPoint(param);
        			}
        		} else {
    				if(add()) {
    					param.put("point", pointG/2);
        				this.miniGameService.modifyGamePoint(param);
        				param.put("point", pointB/2);
                		saveCnt = this.miniGameService.modifyBPoint(param);
        			} else {
        				pointG += pointG/2-pointG;
        				param.put("point", pointG);
        				this.miniGameService.modifyGamePoint(param);
        				pointB += pointB/2-pointG;
        				param.put("point", pointB);
                		saveCnt = this.miniGameService.modifyBPoint(param);
        			}
        		}
        	}
        	
        } else if (objDegree.equals("good")) {
        	int pointNum = 0;
        	pointNum = Integer.parseInt(str[0]);
        	param.put("point", pointNum);
        	act = "습득";
        	
            if (objKind.equals("site")) {
            	saveCnt = this.miniGameService.modifyBPoint(param);
            	
            } else if (objKind.equals("game")) {
            	saveCnt = this.miniGameService.modifyGamePoint(param);
            	
            } else if (objKind.equals("luxury")){
            	if (itemList.size()<=8) {
            		itemList.add(objSeq);
            	}
            	System.out.println("itemList : "+itemList);
            	param.put("item", itemList.toString());
            	saveCnt = this.miniGameService.updatePlayer(param);
            } else if (objKind.equals("food")){
            	 if (objSeq==28) {
            		recentHp = hp;
            	} else if (objSeq==23) {
            		hp += 1;
            		recentHp = hp;
            	} else {
            		recentHp += Integer.parseInt(str[0]);
            	}
            	 
            	if(recentHp>=hp) {
             		recentHp=hp;
             	}
            	 
            	param.put("hp", hp);
                param.put("recentHp", recentHp);
                saveCnt = this.miniGameService.updatePlayer(param);
                act = "냠냠";
            } else if (objSeq==48) {
            	quest = "[1, 0, 0]";
            	param.put("quest", quest);
        		recentHp = hp;
        		param.put("recentHp", recentHp);
        		param.put("point", Integer.parseInt(str[0]));
        		this.miniGameService.modifyGamePoint(param);
        		saveCnt = this.miniGameService.updatePlayer(param);
        		act = "마주";
            } else if (objSeq==30) {
            	 int ins = 0;
                 int d = (int) (Math.random() * 101);
                 if (0 <= d && d <= 64) {
                	 ins = 41;
                 } else if (65 <= d && d <= 77) {
                	 ins = 44;
                 } else if (78 <= d && d <= 97) {
                	 ins = 45;
                 } else if (98 <= d && d <= 99) {
                 	ins = 42;
                 } else if (d==100) {
                 	ins = 47;
                 }
            	if (itemList.size()<=8) {
            		itemList.add(ins);
            	}
            	
            	map.put("boxIn", ins);
            	param.put("item", itemList.toString());
            	saveCnt = this.miniGameService.updatePlayer(param);
        		act = "습득";
        		
            } else if (objSeq==29) {
            	if(quest.equals("[1, 0, 0]")) {
            		quest = "[1, 1, 0]";
            	} else {
            		quest = "[0, 1, 0]";
            	}
            	param.put("quest", quest);
        		saveCnt = this.miniGameService.updatePlayer(param);
	    		act = "습득";
	        }
        }
        
        this.miniGameService.selectPlayer(id);
        
        //로그 저장
        int cntSaveLog = 0;
        
        param.put("object", objName);
        param.put("act", act);
        param.put("userId", id);
        param.put("result", str[1] + objName);
        param.put("dicenum", diceNum);
        param.put("round", round);
        
        System.out.println("param : " + param);
        
        cntSaveLog = this.miniGameService.insertLog(param);
        
        List<BrownieMarbelLogVO> logs = this.miniGameService.selectLogs(param);
        
        String log = "";
        
        for (BrownieMarbelLogVO vo : logs) {
        	log += "<p class='logWrite'><i class='far fa-clock'></i> "+vo.getTime() + "(주사위눈 : "+vo.getDicenum()+") ("+vo.getResult()+")<br>"+vo.getRound()+"-"+vo.getLogSeq()+". "+vo.getUserId()+"은(는) "+vo.getObject()+"을(를) "+vo.getAct()+"했다.</p>";
		}
        
        //
        String item2 = this.miniGameService.selectPlayer(id).getItem();
        
        item2 = item2.replace("[", "");
        item2 = item2.replace("]", "");
        
        List<Integer> itemList2 = new ArrayList<>();
        List<BrownieMarbelInfoVO> itemInfo2 = new ArrayList<BrownieMarbelInfoVO>();
        map.put("items", "");
        if(!item2.equals("")) {
        	String[] items = item2.split(", ");
        
	        
	        for (String n : items) {
	        	itemList2.add(Integer.parseInt(n));
	        }
	
	        for (int n : itemList2) {
	        	itemInfo2.add(this.miniGameService.selectInfo(n));
	        }
	        
	        map.put("items", itemInfo2);
        }
        
        map.put("log",log);
        map.put("player",this.miniGameService.selectPlayer(id)); 
    	map.put("site",this.userService.userOneSelect(id)); 
    	this.miniGameService.updatePlayer(param);
    	if(recentHp<=0) {
    		this.miniGameService.deleteLog(id);
    		int deadCnt = this.miniGameService.deleteMarblePlayer(id);
    		map.put("dead",deadCnt); 
    	}
    	
    	System.out.println("성공");
        return map;
    }

	public boolean add () {
		boolean ans = false;
        int d = (int) (Math.random() * 100);
        if (0 <= d && d <= 49) {
        	ans = true;
        } else if (50 <= d && d <= 99) {
        	ans = false;
        } 
    	return ans;
    }
    
    public List<Integer> addMap(List<Integer> list,boolean bool) {
    	for (int i = 0; i < 15; i++) {
            int ins = 0;
            int d = (int) (Math.random() * 101);
            if (0 <= d && d <= 64) {
            	goodMap(list, bool);
            } else if (65 <= d && d <= 77) {
                neMap(list);
            } else if (78 <= d && d <= 97) {
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
        	//ins = (int) (Math.random() * 8 + 15);
        	ins = 15;
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
    			ins = 34;
    		} else if (0 <= d && d <= 25) {
    			ins = 35;
    		} else if (26 <= d && d <= 50) {
    			ins = 36;
    		} else if (51 <= d && d <= 60) {
    			ins = 37;
    		} else if (61 <= d && d <= 75) {
    			ins = 100;
    		} else if (76 <= d && d <= 80) {
    			ins = 33;
    		} else if (81 <= d && d <= 85) {
    			ins = 38;
    		} else if (86 <= d && d <= 90) {
    			ins = 100;
    		} else if (91 <= d && d <= 93) {
    			ins = 100;
    		} else if (97 <= d && d <= 100) {
    			ins = 39;
    		}
    		list.add(ins);
    	}
    	
    	Collections.shuffle(list);
    	Collections.shuffle(list);
    	Collections.shuffle(list);
    	
    	if (list.contains(100)) {
    		for (int i = 0; i < list.size(); i++) {
    			if (list.get(i) == 100) {
    				int ins = 0;
    				int d = (int) (Math.random() * 101);
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
