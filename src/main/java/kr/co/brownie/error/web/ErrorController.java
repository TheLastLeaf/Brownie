package kr.co.brownie.error.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@ControllerAdvice
@RequestMapping(path = "/error")
public class ErrorController {
    @GetMapping
    public String defaultError() {
        return "error/500";
    }

    @ExceptionHandler(value = {IllegalArgumentException.class, IllegalStateException.class})
    public String illegalError(Exception ex, Model model) {
        model.addAttribute("exception", ex);
        return "error/illegalError";
    }

    @GetMapping("/no-resource")
    public String noResource() {
        return "error/404";
    }

    @GetMapping("/server-error")
    public String serverError() {
        return "error/500";
    }
}