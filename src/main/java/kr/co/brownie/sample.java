package kr.co.brownie;

import org.springframework.web.bind.annotation.GetMapping;

public class sample {
    @GetMapping(path = "/sample")
    public String home() {
        return "sample/home";
    }


}
