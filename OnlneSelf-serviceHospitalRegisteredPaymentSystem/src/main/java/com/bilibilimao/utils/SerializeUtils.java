package com.bilibilimao.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class SerializeUtils {
	//序列化
	public static byte[] serialize(Object obj) {
		try(ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream)) {
			objectOutputStream.writeObject(obj);
			byte[] bs = byteArrayOutputStream.toByteArray();
			return(bs);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//反序列化
	public static Object unserialize(byte[] bs) {
		try(ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bs);
			ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream)) {
			Object obj = objectInputStream.readObject();
			return(obj);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
}