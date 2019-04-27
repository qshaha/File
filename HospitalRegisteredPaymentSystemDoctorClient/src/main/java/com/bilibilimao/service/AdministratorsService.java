package com.bilibilimao.service;

import com.bilibilimao.po.Administrators;

public interface AdministratorsService {
	public String findAdministratorsAndLogin(Administrators administrators);
	public void updateAdministratorsPassword(Administrators administrators) throws Exception;
}