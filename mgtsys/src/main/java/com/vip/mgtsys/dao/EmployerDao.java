package com.vip.mgtsys.dao;

import org.apache.ibatis.annotations.Param;

import com.vip.mgtsys.model.EmployerInfo;

public interface EmployerDao {

	public EmployerInfo getEmployerInfo(@Param("usrId") String usrId, @Param("pwd") String pwd);
	
	public int getMaxSid(@Param("sysDate") String sysDate);
	
	public int insertEmployer(@Param("sid") String sid,
			                  @Param("employerId") String employerId,
			                  @Param("employerPwd") String employerPwd,
			                  @Param("employerMail") String employerMail,
			                  @Param("employerStatus") String employerStatus
			                 );
}
