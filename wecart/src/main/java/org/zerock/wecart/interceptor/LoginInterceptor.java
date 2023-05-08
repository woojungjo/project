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
public class LoginInterceptor implements HandlerInterceptor {
	
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
		Object auth = session.getAttribute("__AUTH__");
		
		if(auth != null) {
			session.removeAttribute("__AUTH__");
			log.info("\t+ 세션영역에서 인증객체(__AUTH__) 삭제 완료");
		} // if
		
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
		UserVO userVO = (UserVO)modelMap.get("__AUTH__");
		
		if(userVO != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("__AUTH__", userVO);
			log.info("\t 세션영역에 새로운 인증객체 저장 성공");
		} // if
		
		// 세션에서 이전 페이지 URL을 가져옴
        String prevPage = (String) request.getSession().getAttribute("prevPage");
        if (prevPage != null) {
            // 이전 페이지 URL을 세션에서 삭제
            request.getSession().removeAttribute("prevPage");
            // 이전 페이지로 리다이렉트
            response.sendRedirect(prevPage);
        } // if

	} // postHandle

} // end class
