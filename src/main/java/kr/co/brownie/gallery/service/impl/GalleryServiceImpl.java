package kr.co.brownie.gallery.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.gallery.service.GalleryService;
import kr.co.brownie.gallery.service.GalleryVO;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService {
	@Resource(name="galleryMapper")
	GalleryMapper galleryMapper;

	@Override
	public int insertGallery(Map<String, Object> map) {
		int boardSeq = galleryMapper.insert(map);
		return boardSeq;
	}

	@Override
	public List<GalleryVO> getGallerylist(Map<String, Object> map) {
		List<GalleryVO> galleryVo = galleryMapper.selList();
		return galleryVo;
	}

	@Override
	public int deleteGallery(int boardSeq) {
		return galleryMapper.delete(boardSeq);
	}

	@Override
	public GalleryVO getGallery(int boardSeq) {
		GalleryVO galleryVo = galleryMapper.read(boardSeq);
		return galleryVo;
	}

	@Override
	public int updateGallery(Map<String, Object> map) {
		return galleryMapper.update(map);
	}

	@Override
	public int selectCount() {
		return galleryMapper.count();
	}
}
