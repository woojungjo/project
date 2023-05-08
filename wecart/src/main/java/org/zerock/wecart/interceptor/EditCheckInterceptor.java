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
public class EditCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
	) throws Exception {
		log.trace("======================================================================================");
		log.trace("preHandle(request, response, {}", handler);
		log.trace("======================================================================================");
		
		HttpSession session = request.getSession();
		
		Long expireTime = (Long) session.getAttribute("__CHECK__.expireTime");
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
		    session.removeAttribute("__CHECK__");
		    session.removeAttribute("__CHECK__.expireTime");
		}
		
		return true;
	} // preHandle

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
		UserVO userVO = (UserVO)modelMap.get("__CHECK__");
		
		if(userVO != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("__CHECK__", userVO);
			log.info("\t 유저정보 재확인 완료하여 세션에 저장");
			
			// 체크 객체 유효시간 설정 (5분)
			session.setAttribute("__CHECK__.expireTime", System.currentTimeMillis() + 5 * 60 * 1000);
		} // if
		
	} // postHandle

} // end class
