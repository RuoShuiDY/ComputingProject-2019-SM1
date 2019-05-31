package com.txg.project.interceptor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.txg.project.domain.Lecturer;
import com.txg.project.domain.Tutor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = arg0.getSession();
		Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
		Tutor tutor = (Tutor) session.getAttribute("tutor");
		if(lecturer == null && tutor==null) {
			arg0.setAttribute("msg", "LoginFirst");
			//arg0.getRequestDispatcher("/user/loginUI").forward(arg0, arg1);
			arg1.sendRedirect("/user/loginUI");
			return false;
		}
		
		return true;
	}

}
