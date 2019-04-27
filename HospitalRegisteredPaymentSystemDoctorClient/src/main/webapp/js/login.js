$(function() {
	layui.use(["element", "form", "layer"], function(){
		var element = layui.element,
		form = layui.form,
		layer = layui.layer;
		form.on("radio(leve)", function(data) {
			if(data.value === "1") {
				$("form").attr("action", "/HospitalRegisteredPaymentSystemDoctorClient/admin/login");
			}
			else {
				$("form").attr("action", "/HospitalRegisteredPaymentSystemDoctorClient/doctor/login");
			}
		});
		form.on("submit(login)", function(request) {
			$.ajax({
				url: "/HospitalRegisteredPaymentSystemDoctorClient/" + ($(":input:checked").val() === "1" ? "admin/login" : "doctor/login"),
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