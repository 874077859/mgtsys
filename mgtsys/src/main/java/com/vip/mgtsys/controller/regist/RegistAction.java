package com.vip.mgtsys.controller.regist;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.vip.mgtsys.constant.Constant;
import com.vip.mgtsys.model.EmployerInfo;
import com.vip.mgtsys.model.RegistInfo;
import com.vip.mgtsys.service.regist.RegistService;

@Controller
@SessionAttributes("registInfo")
@RequestMapping("/regist")
public class RegistAction {

	@Autowired
	private RegistService registService;
	
	@RequestMapping("/goRegist")
	public String goRegist() {
		return "regist/regist";
	}
	
	@RequestMapping("/goRegistProtocal")
	@ResponseBody
	public void goRegistProtocal(Model model, @RequestBody RegistInfo registInfo) {
		model.addAttribute("registInfo", registInfo);
	}
	
	@RequestMapping("/registProtocal")
	public String registProtocal() {
		return "regist/protocal";
	}
	
	@RequestMapping("/doAgreeProtocal")
	@ResponseBody
	public void agreeProtocal(Model model, @RequestParam String flg) {
		RegistInfo registInfo = (RegistInfo)model.asMap().get("registInfo");
		registInfo.setAgreed(flg);
		model.addAttribute("registInfo", registInfo);
	}
	
	@RequestMapping("/getRegistInfo")
	@ResponseBody
	public RegistInfo getRegistInfo(Model model) {
		return (RegistInfo)model.asMap().get("registInfo");
	}
	
	@RequestMapping("/doBack")
	@ResponseBody
	public void back(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
	}
	
	@RequestMapping("/doRegist")
	@ResponseBody
	public String doRegist(@RequestBody RegistInfo registInfo, HttpSession session) {
		
		EmployerInfo employerInfo = registService.getEmployerInfo(registInfo.getUserId(), null);
		
		if(null != employerInfo) {
			return "1";
		}
		
		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		int sid = registService.getMaxSid(formatter.format(dt));
		
		formatter = new SimpleDateFormat("yyyyMMdd");
		String newSid = formatter.format(dt).concat(String.format("00000", sid+1));
		employerInfo = new EmployerInfo();
		employerInfo.setSid(newSid);
		employerInfo.setEmployerId(registInfo.getUserId());
		employerInfo.setEmployerMail(registInfo.getEmail());
		employerInfo.setEmployerPwd(registInfo.getPwd());
		employerInfo.setEmployerStatus(Constant.EMPLOYER_STATUS_01);
		registService.insertEmployer(employerInfo);
		
		session.setAttribute("sid", newSid);
		
		return "0";
	}
}
