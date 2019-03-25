package com.bilibilimao.utils;

public class SerializeAndBase64string {
	public static String SerializeToBase64string(Object obj) {
		byte[] bs = SerializeUtils.serialize(obj);
		return(Base64stringAndByteArray.byteArrayToBase64string(bs));
	}
	public static Object Base64stringToSerialize(String s) {
		byte[] bs = Base64stringAndByteArray.Base64stringToByteArray(s);
		return(SerializeUtils.unserialize(bs));
	}
}