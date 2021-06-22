package kr.co.brownie.gallery.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.gallery.service.GalleryService;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService {
	@Resource(name = "galleryDAO")
	GalleryDAO galleryDAO;
}
