package com.bilibilimao.utils;

public class SelectConversion {
	public static int departmentConversion(String s) {
		switch(s) {
			case "心血管科" : return 1;
			case "血液科" : return 2;
			case "呼吸与危重症医学科" : return 3;
			case "消化内科" : return 4;
			case "内分泌科" : return 5;
			case "神经内科" : return 6;
			case "肾内科" : return 7;
			case "眼科" : return 8;
			case "心血管外科" : return 9;
			case "胃肠外科" : return 10;
			case "小儿外科" : return 11;
			case "泌尿外科" : return 12;
			case "骨科" : return 13;
			case "感染性疾病科" : return 14;
			case "耳鼻喉头颈外科" : return 15;
			case "急诊科" : return 16;
			case "麻醉科" : return 17;
			default : return 18;
		}
	}
	public static int educationConversion(String s) {
		switch(s) {
			case "专科" : return 1;
			case "本科" : return 2;
			case "硕士" : return 3;
			default : return 4;
		}
	}
}