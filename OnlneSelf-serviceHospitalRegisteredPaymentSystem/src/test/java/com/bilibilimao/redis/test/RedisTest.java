package com.bilibilimao.redis.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;

public class RedisTest {
	public static void main(String[] args) {
		AbstractApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext-redis.xml");
		Jedis jedis = applicationContext.getBean("jedis", Jedis.class);
		jedis.set("name", "张三");
		applicationContext.close();
	}
}