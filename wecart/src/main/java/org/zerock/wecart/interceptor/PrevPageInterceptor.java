package org.zerock.wecart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Component
public class PrevPageInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
	) throws Exception {
		log.trace("======================================================================================");
		log.trace("preHandle(request, response, {}", handler);
		log.trace("======================================================================================");
		
		request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
        return true;
        
	} // preHandle

} // end class
