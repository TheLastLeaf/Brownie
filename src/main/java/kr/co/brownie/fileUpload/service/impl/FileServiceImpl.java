package kr.co.brownie.fileUpload.service.impl;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.brownie.fileUpload.service.FileService;

@Service("fileService")
public class FileServiceImpl implements FileService{
	@Resource(name = "fileMapper")
	FileMapper fileMapper;

	@Override
	public void insertPath(Map<String, Object> map) {
		fileMapper.insertPath(map);
	}
}
