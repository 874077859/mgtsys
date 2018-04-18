package com.vip.mgtsys.service.regist;

import com.vip.mgtsys.model.EmployerInfo;

public interface RegistService {

	EmployerInfo getEmployerInfo(String usrId, String pwd);
	
	int getMaxSid(String sysDate);
	
	int insertEmployer(EmployerInfo employerInfo);
	
	int updateEmployer(EmployerInfo employerInfo);
}
