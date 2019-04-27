<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-个人信息</title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/personalInformation.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div id="headtable" class="layui-header" style="background-color: white;">
			<table class="layui-table" lay-skin="nob">
				<colgroup>
					<col width="150px" />
					<col width="500px" />
					<col width="" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td><p>当前位置：<a href="${pageContext.request.contextPath}/index2">首页</a>>>个人信息</p></td>
						<td><p name="nowtime" style="float: right;"></p></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="layui-main">
			<form action="${pageContext.request.contextPath}/patient/resetInfo" method="post">
				<div style="width: 450px; margin: 0 auto;">
					<table class="layui-table">
					  <colgroup>
					    <col width="200">
					    <col width="250">
					  </colgroup>
					  <tbody>
					    <tr>
					    	<td class="layui-bg-gray">姓名</td>
					    	<td>${patientinfo.name}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">性别</td>
					    	<td>${patientinfo.sex}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">出生日期</td>
					    	<td>${patientinfo.birth}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">身份证号</td>
					    	<td>${patientinfo.idCard}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">家庭住址</td>
					    	<td>${patientinfo.address}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">手机号码</td>
					    	<td>${patientinfo.number}</td>
					    </tr>
					    <tr>
					    	<td class="layui-bg-gray">账号注册时间</td>
					    	<td>${patientinfo.registrationTime}</td>
					    </tr>
					  </tbody>
					</table>
				</div>
				<input type="hidden" name="id" value="${patientinfo.id}" />
	    		<p style="text-align: center; margin-top: 30px;"><input type="button" value="编辑信息"  class="layui-btn" /></p>
			</form>
		</div>
		<%@ include file="/WEB-INF/master/tail.jsp" %>
	</div>
</body>
</html>