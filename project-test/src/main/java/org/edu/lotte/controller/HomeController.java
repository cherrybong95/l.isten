package org.edu.lotte.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.edu.lotte.business.BusinessDTO;
import org.edu.lotte.model.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private BusinessDTO dto;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(method=RequestMethod.POST,value="main.do")
	public String bicycleList(HttpServletRequest request,MemberVO mvo){
		String id="lotte";
		String pwd="1234";
		String userId= mvo.getUserId();
		String passWord= mvo.getPassWord();
		System.out.println(userId);
		System.out.println(passWord);
		if(id.equals(userId) && pwd.equals(passWord)) {
			HttpSession session=request.getSession();
			session.setAttribute("user", userId);
			return "main";
		}
		return "login_fail";
	}
	@RequestMapping("graph.do")
	public String showGraph(HttpServletRequest request) {
		
		return "graph_test";
	}
	@RequestMapping("oracle.do")
	public String oracle(HttpServletRequest request) {
		
		return "oracle";
	}
	
}
