package kr.co.brownie.fileUpload.service;

import java.io.File;
import java.util.Map;

public interface FileService {

	void defaultProfile(String id);

	void updateProfile(Map<String, Object> map);

	String selectProfile(String id);


}
