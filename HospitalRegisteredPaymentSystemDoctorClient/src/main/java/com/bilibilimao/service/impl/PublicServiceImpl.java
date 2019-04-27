package com.bilibilimao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bilibilimao.service.PublicService;
import redis.clients.jedis.Jedis;

@Service
public class PublicServiceImpl implements PublicService {
	@Autowired
	private Jedis jedis;
	@Override
	public void deleteUserByRedis(String uuid) {
		jedis.del(uuid);
	}
}
