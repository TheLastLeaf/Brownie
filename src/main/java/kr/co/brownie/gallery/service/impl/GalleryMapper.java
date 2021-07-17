package kr.co.brownie.gallery.service.impl;

import kr.co.brownie.board.reply.service.ReplyVO;
import kr.co.brownie.gallery.service.FileVO;
import kr.co.brownie.gallery.service.GalleryVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository("galleryMapper")
public interface GalleryMapper {
    int insert(Map<String, Object> map);

    List<GalleryVO> selectList(Map<String, Object> map);

    List<GalleryVO> noticeList(Map<String, Object> map);

    GalleryVO read(int boardSeq);

    int delete(int boardSeq);

    int count();

    int update(Map<String, Object> map);

    List<FileVO> selectFiles(int fileSeq);

    int selectFile(String fileName);

    int insertThumb(String fileName);

    ReplyVO galleryAB(int boardSeq);

    List<GalleryVO> selectAB(int boardSeq);
}
