package com.vip.mgtsys.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vip.mgtsys.model.EmployerInfo;
import com.vip.mgtsys.service.login.LoginService;

@Controller
public class LoginAction {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/index")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/doLogin")
	@ResponseBody
	public EmployerInfo doLogin(@RequestParam String userId,
			@RequestParam String pwd, HttpSession session) {
		
		EmployerInfo employerInfo = loginService.getEmployerInfo(userId, pwd);
		if(null != employerInfo &&
				(null != employerInfo.getEmployerId() || "".equals(employerInfo.getEmployerId()))) {
			session.setAttribute("employerInfo", employerInfo);
		}
		
		// 用户信息取得
		return employerInfo;
	}
}
