package kr.co.brownie;

import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

public class sample {
    @GetMapping(path = "/sample")
    public String home() {
        return "sample/home";
    }


}
