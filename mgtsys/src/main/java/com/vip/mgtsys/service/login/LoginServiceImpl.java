package com.vip.mgtsys.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vip.mgtsys.dao.EmployerDao;
import com.vip.mgtsys.model.EmployerInfo;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private EmployerDao employerDao;
	
	@Override
	public EmployerInfo getEmployerInfo(String usrId, String pwd) {
		return employerDao.getEmployerInfo(usrId, pwd);
	}
}
