package com.vip.mgtsys.service.employer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vip.mgtsys.dao.EmployerDao;
import com.vip.mgtsys.model.EmployerInfo;

@Service("employerService")
public class EmployerServiceImpl implements EmployerService {
	
	@Autowired
	private EmployerDao employerDao;

	@Override
	public int updateEmployer(EmployerInfo employerInfo) {
		return employerDao.updateEmployer(employerInfo.getEmployerName(),
				                          employerInfo.getEmployerTel(),
				                          employerInfo.getEmployerAddress(),
				                          employerInfo.getEmployerPermission(),
				                          employerInfo.getSid());
	}
}
