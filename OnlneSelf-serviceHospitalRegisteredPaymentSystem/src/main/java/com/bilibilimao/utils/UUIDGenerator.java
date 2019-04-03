package com.bilibilimao.utils;

import java.util.UUID;

public class UUIDGenerator {
	//返回的uuid去除横杠和全部转小写
	public static String simplifyUUID() {
		return(UUID.randomUUID().toString().replaceAll("-", "").toLowerCase());
	}
	//返回uuid
	public static String normalUUID() {
		return(UUID.randomUUID().toString());
	}
}