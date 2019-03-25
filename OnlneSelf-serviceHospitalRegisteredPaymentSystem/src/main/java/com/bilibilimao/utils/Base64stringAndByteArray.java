package com.bilibilimao.utils;

import java.util.Base64;

public class Base64stringAndByteArray {
	public static String byteArrayToBase64string(byte[] bs) {
		return(Base64.getEncoder().encodeToString(bs));
	}
	public static byte[] Base64stringToByteArray(String s) {
		return(Base64.getDecoder().decode(s));
	}
}