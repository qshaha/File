$(function() {
	layui.use(["element", "form"], function() {
		var element = layui.element,
		form = layui.form;
		form.verify({
			pass: function(value, item) {
				if(value.length < 6 || value.length > 12) {
					return "请输入大于6位小于12位字符";
				}
				if(!new RegExp("[0-9a-zA-Z]{6,12}").test(value)) {
					return "只能输入英文和数字";
				}
			},
			rePassword: function(value, item) {
				if(value != $(":password[name='password']").val()) {
					return "两次密码不一样";
				}
			}
		});
		form.on("submit(doctorReset)", function(request) {
			$.ajax({
				url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/resetPassword",
				data: request.field,
				dataType: "json",
				type: "POST",
				success: function(data) {
					layer.open({
						title: data.result,
						content: data.content,
						btn: "确定",
						yes: function() {
							window.location.href=data.redirect;
						},
						cancel: function() {
							return false;
						}
					});
				}
			});
			return false;
		});
		form.on("submit(adminReset)", function(request) {
			$.ajax({
				url: "/HospitalRegisteredPaymentSystemDoctorClient/admin/resetPassword",
				data: request.field,
				dataType: "json",
				type: "POST",
				success: function(data) {
					layer.open({
						title: data.result,
						content: data.content,
						btn: "确定",
						yes: function() {
							window.location.href=data.redirect;
						},
						cancel: function() {
							return false;
						}
					});
				}
			});
			return false;
		});
		form.on("submit(adminResetDefault)", function(request) {
			$.ajax({
				url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/resetDefaultPassword",
				data: request.field,
				dataType: "json",
				type: "POST",
				success: function(data) {
					layer.open({
						title: data.result,
						content: data.content,
						btn: "确定",
						yes: function() {
							window.location.href=data.redirect;
						},
						cancel: function() {
							return false;
						}
					});
				}
			});
			return false;
		});
	});
});