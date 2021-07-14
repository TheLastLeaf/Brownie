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
	public void defaultProfile(String id) {
		fileMapper.defaultProfile(id);
	}
	
	@Override
	public void updateProfile(Map<String, Object> map) {
		fileMapper.updateProfile(map);
	}

	@Override
	public String selectProfile(String id) {
		return fileMapper.selectProfile(id);
	}
}
