package kr.co.brownie.fileUpload.service.impl;

import java.io.File;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("fileMapper")
public interface FileMapper {

	void insertPath(Map<String, Object> map);

}
