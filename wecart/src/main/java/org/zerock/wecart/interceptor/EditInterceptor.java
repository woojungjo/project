package org.zerock.wecart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.wecart.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Component
public class EditInterceptor implements HandlerInterceptor {
	
	@Override
	public void postHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView modelAndView
	) throws Exception {
		log.trace("======================================================================================");
		log.trace("postHandle(request, response, handler, modelAndView)");
		log.trace("======================================================================================");
	
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO userVO = (UserVO)modelMap.get("__AUTH__");
		
		log.info("\t>>>>>>>>>>>>>>>>>>>>>>>>>>>> userVO: {}", userVO);
		
		if(userVO != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("__AUTH__", userVO);
			log.info("\t 수정사항 인증객체에 반영");
		} // if
		
	} // postHandle

} // end class
