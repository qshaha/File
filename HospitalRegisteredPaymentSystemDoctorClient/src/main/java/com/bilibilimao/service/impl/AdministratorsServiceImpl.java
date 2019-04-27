package com.bilibilimao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.mapper.AdministratorsMapper;
import com.bilibilimao.po.Administrators;
import com.bilibilimao.service.AdministratorsService;
import com.bilibilimao.utils.SerializeAndBase64string;
import com.bilibilimao.utils.UUIDGenerator;

import redis.clients.jedis.Jedis;

@Service
public class AdministratorsServiceImpl implements AdministratorsService {
	@Autowired
	private AdministratorsMapper administratorsMapper;
	@Autowired
	private Jedis jedis;
	@Override
	public String findAdministratorsAndLogin(Administrators administrators) {
		List<Administrators> list = administratorsMapper.findAdministrators(administrators);
		if(list != null && list.size() > 0) {
			String uuid = UUIDGenerator.simplifyUUID();
			jedis.setex(uuid, 1800, SerializeAndBase64string.SerializeToBase64string(list.get(0)));
			return(uuid);
		}
		else {
			return null;
		}
	}
	@Override
	public void updateAdministratorsPassword(Administrators administrators) throws Exception {
		administratorsMapper.updateAdministrators(administrators);
	}
}