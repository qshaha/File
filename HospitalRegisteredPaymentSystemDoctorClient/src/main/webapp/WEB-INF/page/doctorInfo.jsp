<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-医生详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/doctorInfo.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
				<div class="layui-tab-item layui-show">
					<div class="layui-main">
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
							<legend>账号注册</legend>
						</fieldset>
						<div class="lay-row" style="height: 260px;line-height: 30px; border-bottom: 1px dotted;">
							<div class="layui-col-md3">
								<img alt="" src="" style="width: 182px; height: 230px;" />
							</div>
							<div class="layui-col-md9">
								<button type="button" class="layui-btn" id="button1">
									<i class="layui-icon">&#xe67c;</i>上传图片
								</button>
								<input id="button2" class="layui-btn" type="button" value="修改信息" />
							</div>
						</div>
						<div id="id1" class="lay-row" style="min-height: 260px;"></div>
						<div id="id2" class="lay-row" style="min-height: 260px;">
							<p style="font-size: 16px; font-weight: bold;">出诊时间：</p>
							<table class="layui-table">
								<colgroup>
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
									<col width="124px" />
								</colgroup>
								<thead>
									<tr>
										<th style="border-right-width: 0"></th>
										<th style="border-left-width: 0"><p style="text-align: center;">一</p></th>
										<th><p style="text-align: center;">二</p></th>
										<th><p style="text-align: center;">三</p></th>
										<th><p style="text-align: center;">四</p></th>
										<th><p style="text-align: center;">五</p></th>
										<th><p style="text-align: center;">六</p></th>
										<th><p style="text-align: center;">日</p></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><p style="text-align: center;">上午</p></td>
										<td id="周一上"></td>
										<td id="周二上"></td>
										<td id="周三上"></td>
										<td id="周四上"></td>
										<td id="周五上"></td>
										<td id="周六上"></td>
										<td id="周日上"></td>
									</tr>
									<tr>
										<td><p style="text-align: center;">下午</p></td>
										<td id="周一下"></td>
										<td id="周二下"></td>
										<td id="周三下"></td>
										<td id="周四下"></td>
										<td id="周五下"></td>
										<td id="周六下"></td>
										<td id="周日下"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/master/tail.jsp" %>
		</div>
</body>
</html>