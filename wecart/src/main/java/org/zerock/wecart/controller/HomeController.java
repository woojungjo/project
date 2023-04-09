package org.zerock.wecart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
public class HomeController {

    @GetMapping("/")      // 홈화면으로 이동
    public String home() {
    	log.trace("home() invoked.");
       return "home";
    }

    @GetMapping("/main")   // 메인화면으로 이동
    public String main() {
    	log.trace("main () invoked.");
       return "main/main";
    }
    
}//RootController