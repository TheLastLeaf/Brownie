package kr.co.brownie.gallery.service;

import java.util.List;
import java.util.Map;

public interface GalleryService {
	public int insertGallery(Map<String, Object> map);

    public List<GalleryVO> getGallerylist(Map<String, Object> map);

    public int deleteGallery(int boardSeq);

    public GalleryVO getGallery(int boardSeq);

    public int updateGallery(Map<String,Object> map);

    public int selectCount();
    
    public List<FileVO> getFileList(int fileSeq);
}
