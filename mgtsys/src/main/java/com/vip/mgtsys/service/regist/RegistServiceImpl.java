package com.vip.mgtsys.service.regist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vip.mgtsys.dao.EmployerDao;
import com.vip.mgtsys.model.EmployerInfo;

@Service("registService")
public class RegistServiceImpl implements RegistService {
	
	@Autowired
	private EmployerDao employerDao;
	
	@Override
	public EmployerInfo getEmployerInfo(String usrId, String pwd) {
		return employerDao.getEmployerInfo(usrId, pwd);
	}

	@Override
	public int getMaxSid(String sysDate) {
		return employerDao.getMaxSid(sysDate);
	}

	@Override
	public int insertEmployer(EmployerInfo employerInfo) {
		return employerDao.insertEmployer(employerInfo.getSid(),
				                          employerInfo.getEmployerId(),
				                          employerInfo.getEmployerPwd(),
				                          employerInfo.getEmployerMail(),
				                          employerInfo.getEmployerStatus());
	}
}
