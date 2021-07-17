package kr.co.brownie.fileUpload.service.impl;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("fileMapper")
public interface FileMapper {

    void defaultProfile(String id);

    void updateProfile(Map<String, Object> map);

    String selectProfile(String id);


}
