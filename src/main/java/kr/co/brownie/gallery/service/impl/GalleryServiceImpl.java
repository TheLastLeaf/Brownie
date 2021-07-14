package kr.co.brownie.gallery.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.gallery.service.FileVO;
import kr.co.brownie.gallery.service.GalleryService;
import kr.co.brownie.gallery.service.GalleryVO;
import kr.co.brownie.reply.service.ReplyVO;

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
	public List<GalleryVO> getGalleryList(Map<String, Object> map) {
		List<GalleryVO> galleryVo = galleryMapper.selectList(map);
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

	@Override
	public List<FileVO> getFileList(int fileSeq) {
		return galleryMapper.selectFiles(fileSeq);
	}

	@Override
	public List<GalleryVO> getNoticeList(Map<String, Object> map) {
		return galleryMapper.noticeList(map);
	}

	@Override
	public int insertThumbnail(String fileName) {
		return galleryMapper.insertThumb(fileName);
	}

	@Override
	public int selectFile(String fileName) {
		return galleryMapper.selectFile(fileName);
	}

	@Override
	public ReplyVO galleryAB(int boardSeq) {
		return galleryMapper.galleryAB(boardSeq);
	}

	@Override
	public List<GalleryVO> selectAB(int boardSeq) {
		return galleryMapper.selectAB(boardSeq);
	}
}
