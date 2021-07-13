package kr.co.brownie.gallery.service;

import java.util.List;
import java.util.Map;

import kr.co.brownie.reply.service.ReplyVO;

public interface GalleryService {
	public int insertGallery(Map<String, Object> map);

    public List<GalleryVO> getGalleryList(Map<String, Object> map);
    
    public List<GalleryVO> getNoticeList(Map<String, Object> map);

    public int deleteGallery(int boardSeq);

    public GalleryVO getGallery(int boardSeq);

    public int updateGallery(Map<String,Object> map);

    public int selectCount();
    
    public List<FileVO> getFileList(int fileSeq);
    
    public int insertThumbnail(String fileName);
    
    public int selectFile(String fileName);
    
    public ReplyVO galleryAB(int boardSeq);
}
