package com.vip.mgtsys.controller.employer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vip.mgtsys.constant.Constant;
import com.vip.mgtsys.model.EmployerInfo;
import com.vip.mgtsys.service.employer.EmployerService;

@Controller
@RequestMapping("/employer")
public class EmployerAction {
	
	@Autowired
	private EmployerService employerService;

	@RequestMapping("/employer")
	public String employer() {
		return "employer/employer";
	}
	
	@RequestMapping("/doCommit")
	@ResponseBody
	public void commit(@RequestBody EmployerInfo employerInfo, HttpSession session) {
		employerInfo.setEmployerPermission(Constant.EMPLOYER_PERMISSION_01);
		employerInfo.setSid((String)session.getAttribute("sid"));
		employerService.updateEmployer(employerInfo);
	}

	@RequestMapping("/addEmployee")
	public String addEmployee() {
		return "employer/employee";
	}
	
	@RequestMapping("/employee")
	public String employee() {
		return "employer/employee";
	}
	
	@RequestMapping("/getEmployeeInfo")
	@ResponseBody
	public EmployerInfo getUserInfo(HttpSession session) {
		return (EmployerInfo)session.getAttribute("employerInfo");
	}
}
