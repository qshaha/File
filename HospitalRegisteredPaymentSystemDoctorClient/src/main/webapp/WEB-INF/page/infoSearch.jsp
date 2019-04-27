<%@page import="com.bilibilimao.utils.SelectConversion"%>
<%@page import="com.bilibilimao.po.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>武汉文理医院-信息查询</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/infoSearch.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<%@ include file="/WEB-INF/master/head.jsp" %>
		<div class="layui-body layui-tab-content site-demo site-demo-body">
				<div class="layui-tab-item layui-show">
					<div class="layui-main">
						<div class="layui-tab">
							<ul class="layui-tab-title">
								<%
									if(request.getAttribute("user") instanceof Doctor) {
								%>
									<li class="layui-this">我的信息</li>
								<%
									}
									else {
								%>
								<li class="layui-this">医生信息</li>
								<% } %>
							</ul>
							<div class="layui-tab-content">
								<%
									if(request.getAttribute("user") instanceof Doctor) {
								%>
									<div class="layui-tab-item layui-show">
										<div class="lay-row" style="height: 260px;line-height: 30px; border-bottom: 1px dotted;">
											<div class="layui-col-md3">
												<c:if test="${empty user.photo}">
													<img alt="" src="${pageContext.request.contextPath}/image/医生默认头像.png" style="width: 182px; height: 230px;">
												</c:if>
												<c:if test="${!empty user.photo}">
													<img alt="" src="/img/doctorPhoto/${user.photo}" style="width: 182px; height: 230px;">
												</c:if>
											</div>
											<div class="layui-col-md9">
												<p style="font-size: 24px; font-weight: bold;">${user.name}</p>
												所在科室：${user.department}
												<br />
												职　　称：${user.position}
												<br />
												专业专长：<%=((Doctor)request.getAttribute("user")).getExperience().substring(5, ((Doctor)request.getAttribute("user")).getExperience().indexOf("个人简介")) %>
											</div>
										</div>
										<div class="lay-row" style="min-height: 260px;">
											<br />
											<p style="font-size: 16px; font-weight: bold;">个人简介：</p>
											<p style="line-height: 28px; text-indent: 1em;">${user.education}。</p>
											<%
												String[] list = ((Doctor)request.getAttribute("user")).getExperience().substring(((Doctor)request.getAttribute("user")).getExperience().indexOf("个人简介") + 5).split("。");
												for(String s : list) {
											%>
											<p style="line-height: 28px; text-indent: 1em;"><%=s %>。</p>
											<% } %>
										</div>
										<div class="lay-row" style="min-height: 260px;">
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
														<td><c:if test="${user.weak.indexOf('周一上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周二上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周三上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周四上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周五上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周六上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周日上')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
													</tr>
													<tr>
														<td><p style="text-align: center;">下午</p></td>
														<td><c:if test="${user.weak.indexOf('周一下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周二下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周三下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周四下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周五下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周六下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
														<td><c:if test="${user.weak.indexOf('周日下')  ge 0}"><p style="text-align: center;"><i class="layui-icon layui-icon-ok"></i></p></c:if></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								<%
									}
									else {
								%>
								<div class="layui-tab-item layui-show">
									<div id="mainpage" class="layui-main"></div>
									<div id="paging"></div>
								</div>
								<% } %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/master/tail.jsp" %>
		</div>
</body>
</html>