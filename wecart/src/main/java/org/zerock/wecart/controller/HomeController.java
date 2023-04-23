package org.zerock.wecart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.zerock.wecart.domain.UserVO;
import org.zerock.wecart.exception.ControllerException;
import org.zerock.wecart.service.town.TownService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
public class HomeController {

	@Setter(onMethod_= @Autowired)
	private TownService service;
	
    @GetMapping("/")      // 홈화면으로 이동
    public String home() {
    	log.trace("home() invoked.");
       return "home";
    }

    @GetMapping("/main")   // 메인화면으로 이동
    public String main() {
    	log.trace("main () invoked.");
       return "main";
    }

    @PostMapping("/main")   // 메인화면으로 이동
    @ResponseBody
    public void main(
    		Model model, 
    		@RequestBody String jsondongInfo, 
    		SessionStatus sessionStatus, 
    		@SessionAttribute("__AUTH__") UserVO auth,
    		HttpServletRequest request
    		) throws ControllerException {
    	log.trace("main ({}, {}) invoked.", jsondongInfo, model);
    		
    	try {
            JSONObject jsonObject = new JSONObject(jsondongInfo);
            String townName = jsonObject.getString("bname");
            
        	String loginId = auth.getLogin_id();
          
            if(loginId != null) { 

        		this.service.update(townName, loginId);
                log.info("loginId:{}, townName:{}", loginId, townName);
                
                HttpSession session = request.getSession();
                session.setAttribute("__TOWN_NAME__", townName);
                } else {
                log.info("loginId = null");
            }
            
    		//return "main";
    	}catch(Exception e) {
    		
    		throw new ControllerException(e);
    	}//try-catch

    }//main
    
    /*
    public String main(
    		@RequestBody String bname,
    		@RequestBody HashMap<String, String> map,
    		Model model, 
    		SessionStatus sessionStatus, 
    		@SessionAttribute("__AUTH__") UserVO auth
    		) throws ControllerException{ 
    	
    	
    	try {
    		Map<String, String> bnameMap = new HashMap<String, String>();
    		bnameMap.put("bname", "data.bname");
    		String townName = bnameMap.get("bname");
    
    		String loginId = auth.getLogin_id();
    		*/	
    
}//HomeController