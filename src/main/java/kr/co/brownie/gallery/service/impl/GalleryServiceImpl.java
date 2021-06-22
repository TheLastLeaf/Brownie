package kr.co.brownie.gallery.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.brownie.gallery.service.GalleryService;
@Service("galleryService")
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	GalleryDAO galleryDAO;
}
