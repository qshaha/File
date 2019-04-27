package com.bilibilimao.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PrintException {
	public static void printExceptionToFile(Exception e) {
		try(BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("C:/Users/code/Documents/Exception.txt"))))) {
			bufferedWriter.write("-------------------------" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()) + "-------------------------\n");
			e.printStackTrace(new PrintStream(new File("C:/Users/code/Documents/Exception.txt")));
			bufferedWriter.newLine();
		} 
		catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} 
		catch (IOException e1) {
			e1.printStackTrace();
		}
	}
}