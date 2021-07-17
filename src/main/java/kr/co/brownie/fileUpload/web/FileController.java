package kr.co.brownie.fileUpload.web;

import kr.co.brownie.fileUpload.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/file")
public class FileController {
    @Resource(name = "fileService")
    FileService fileService;

}
