$(function() {
	layui.use(["element", "form", "laypage"], function(){
		var element = layui.element,
		form = layui.form,
		laypage = layui.laypage;
		$.ajax({
			url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/doctorInfo",
			dataType: "json",
			type: "POST",
			success: function(data) {
				laypage.render({
					elem: "paging",
					count: data.length,
					limit: 10,
					first: "首页",
					last: "尾页",
					jump: function(obj) {
						var arr = [];
						var thisData = data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
						for(var i = 0; i < thisData.length; i += 2) {
							var pageElement = "<div class=\"layui-row\" style=\"line-height: 30px;\">";
							pageElement += "<a target=\"_blank\" href=\"/HospitalRegisteredPaymentSystemDoctorClient/doctorInfo?id=" + thisData[i].id +"\" title=\"点击查看详情\"><div class=\"layui-col-md2\"><img alt=\"\" src=\"" + (thisData[i].photo === null ? "/HospitalRegisteredPaymentSystemDoctorClient/image/医生默认头像.png" : "/img/doctorPhoto/" + thisData[i].photo) + "\" style=\"width: 120px; height: 140px;\" /></div>";
							pageElement += "<div class=\"layui-col-md4\"><p style=\"font-size: 24px; font-weight: bold;\">" + thisData[i].name + "</p>所在科室：" + thisData[i].department + "<br />职　　称：" + thisData[i].position + "<br />专业专长：" + thisData[i].experience.substr(5, thisData[i].experience.indexOf("个人简介") - 5) + "</div></a>";
							if(i + 1 < thisData.length) {
								pageElement += "<a target=\"_blank\" href=\"/HospitalRegisteredPaymentSystemDoctorClient/doctorInfo?id=" + thisData[i + 1].id +"\" title=\"点击查看详情\"><div class=\"layui-col-md2\"><img alt=\"\" src=\"" + (thisData[i + 1].photo === null ? "/HospitalRegisteredPaymentSystemDoctorClient/image/医生默认头像.png" : "/img/doctorPhoto/" + thisData[i + 1].photo) + "\" style=\"width: 120px; height: 140px;\" /></div>";
								pageElement += "<div class=\"layui-col-md4\"><p style=\"font-size: 24px; font-weight: bold;\">" + thisData[i + 1].name + "</p>所在科室：" + thisData[i + 1].department + "<br />职　　称：" + thisData[i + 1].position + "<br />专业专长：" + thisData[i + 1].experience.substr(5, thisData[i + 1].experience.indexOf("个人简介") - 5) + "</div></a>";
							}
							pageElement += "</div><br />";
							arr.push(pageElement);
						}
						$("#mainpage").html(arr.join(""));
					}
				});
			}
		});
	});
});