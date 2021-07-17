package kr.co.brownie.fileUpload.service.impl;

import kr.co.brownie.fileUpload.service.FileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("fileService")
public class FileServiceImpl implements FileService {
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
