import kr.co.brownie.board.service.BoardService;
import kr.co.brownie.board.service.impl.BoardServiceImpl;

import java.util.HashMap;
import java.util.Map;

public class Test {
    public static void main(String[] args) {
        BoardService boardService = new BoardServiceImpl();

        Map<String, Object> map = new HashMap<>();
        map.put("title", "1");
        map.put("content", "<p>23</p>");
        map.put("boardSeq", "123");
        map.put("boardCategory", "");
        map.put("boardKind", "free");
        map.put("userId", "1768503672");

        System.out.println(boardService.update(map));
    }
}
