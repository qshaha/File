$(function() {
	layui.use(["element", "upload", "layer"], function(){
		var element = layui.element,
		upload = layui.upload,
		layer = layui.layer;
		var doctorData = null;
		$.ajax({
			url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/doctorInfo",
			dataType: "json",
			type: "POST",
			success: function(data) {
				for(var i = 0; i < data.length; i += 1) {
					if(data[i].id == window.location.search.substr(window.location.search.indexOf("id=") + 3)) {
						doctorData = data[i];
					}
				}
				if(doctorData != null) {
					if(doctorData.photo === null) {
						$("img").attr("src", "/HospitalRegisteredPaymentSystemDoctorClient/image/医生默认头像.png");
					}
					else {
						$("img").attr("src", "/img/doctorPhoto/" + doctorData.photo);
					}
					$("div.layui-col-md9").prepend("<p style=\"font-size: 24px; font-weight: bold;\">" + doctorData.name + "</p>所在科室：" + doctorData.department + "<br />职　　称：" + doctorData.position + "<br />" + doctorData.experience.substr(0, doctorData.experience.indexOf("个人简介")) + "<br />");
					var text = "<br /><p style=\"font-size: 16px; font-weight: bold;\">个人简介：</p><p style=\"line-height: 28px; text-indent: 1em;\">" + doctorData.education + "。</p>"
					var arr = doctorData.experience.trim().substr(doctorData.experience.indexOf("个人简介") + 5).split("。");
					for(var j = 0; j < arr.length; j += 1) {
						text += "<p style=\"line-height: 28px; text-indent: 1em;\">" + arr[j] + "</p>";
					}
					$("div#id1").html(text);
					var arr2 = doctorData.weak.split("|");
					for(var j = 0; j < arr2.length; j += 1) {
						$("td#" + arr2[j]).html("<p style=\"text-align: center;\"><i class=\"layui-icon layui-icon-ok\"></i></p>");
					}
				}
				else {
					layer.open({
						title: "错误",
						content: "该医生不存在",
						btn: "确定",
						yes: function() {
							window.location.href="/HospitalRegisteredPaymentSystemDoctorClient/index";
						},
						cancel: function() {
							return false;
						}
					});
				}
				upload.render({
					elem: "#button1",
					url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/upload",
					accept: "image",
					field: "myPhoto",
					data: {id: doctorData.id},
					done: function(res) {
						if(res.code === 0) {						
							window.location.href="/HospitalRegisteredPaymentSystemDoctorClient/doctorInfo?id=" + doctorData.id; 
						}
					}
				});
				$(":button#button2").on("click", function() {
					window.location.href="/HospitalRegisteredPaymentSystemDoctorClient/resetDoctorInfo?id=" + doctorData.id;
				});
			}
		});
	});
});