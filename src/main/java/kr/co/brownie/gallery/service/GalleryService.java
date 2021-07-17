package kr.co.brownie.gallery.service;

import kr.co.brownie.board.reply.service.ReplyVO;

import java.util.List;
import java.util.Map;

public interface GalleryService {
    int insertGallery(Map<String, Object> map);

    List<GalleryVO> getGalleryList(Map<String, Object> map);

    List<GalleryVO> getNoticeList(Map<String, Object> map);

    int deleteGallery(int boardSeq);

    GalleryVO getGallery(int boardSeq);

    int updateGallery(Map<String, Object> map);

    int selectCount();

    List<FileVO> getFileList(int fileSeq);

    int insertThumbnail(String fileName);

    int selectFile(String fileName);

    ReplyVO galleryAB(int boardSeq);

    List<GalleryVO> selectAB(int boardSeq);
}
