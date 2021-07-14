package kr.co.brownie.fileUpload.service.impl;

import java.io.File;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("fileMapper")
public interface FileMapper {

	void defaultProfile(String id);

	void updateProfile(Map<String, Object> map);

	String selectProfile(String id);


}
