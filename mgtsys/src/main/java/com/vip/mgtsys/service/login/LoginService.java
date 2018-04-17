package com.vip.mgtsys.service.login;

import com.vip.mgtsys.model.EmployerInfo;

public interface LoginService {

	EmployerInfo getEmployerInfo(String usrId, String pwd);
}
