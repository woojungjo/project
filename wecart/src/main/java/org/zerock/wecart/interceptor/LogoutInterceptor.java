package org.zerock.wecart.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Component
public class LogoutInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler
) throws Exception {
		log.trace("======================================================================================");
		log.trace("preHandle(request, response, {}", handler);
		log.trace("======================================================================================");

		HttpSession session = request.getSession(false);

		session.invalidate();
		log.info("\t+ 세션 파괴");

		response.sendRedirect("/");

		return false;
	} // preHandle

} // end class
