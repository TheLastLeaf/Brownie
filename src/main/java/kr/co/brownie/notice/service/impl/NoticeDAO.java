package kr.co.brownie.notice.service.impl;

import kr.co.brownie.notice.service.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("noticeDAO")
public class NoticeDAO {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public int insert(Map<String,Object> map){
        return this.sqlSessionTemplate.insert("notice.insert",map);
    }

    public List<NoticeVO> listAll(Map<String,Object> map){
        return this.sqlSessionTemplate.selectList("notice.selectList",map);
    }

    public int update(Map<String,Object> map){
        return this.sqlSessionTemplate.update("notice.update",map);
    }

    public int delete(int boardSeq){
        return this.sqlSessionTemplate.update("notice.delete",boardSeq);
    }

    public NoticeVO read(int boardSeq){
        return this.sqlSessionTemplate.selectOne("notice.select_detail",boardSeq);
    }

    public int count(){
        return this.sqlSessionTemplate.selectOne("notice.select_count");
    }
}
