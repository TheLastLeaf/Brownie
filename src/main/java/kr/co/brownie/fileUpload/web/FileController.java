package kr.co.brownie.fileUpload.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.brownie.fileUpload.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {
	@Resource(name = "fileService")
	FileService fileService;
	
}
