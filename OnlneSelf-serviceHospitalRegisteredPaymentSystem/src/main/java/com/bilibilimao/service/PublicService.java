package com.bilibilimao.service;

import com.bilibilimao.po.Patient;

public interface PublicService {
	public boolean idCardIsRegistered(Patient patient);
	public String idCardFindPassword(Patient patient);
	public String findOldPassword(String uuid);
}