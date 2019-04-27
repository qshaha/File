$(function() {
	layui.use(["element", "form", "layer"], function() {
		var element = layui.element,
		form = layui.form,
		layer = layui.layer;
		form.on("submit(cancellation)", function(request) {
			$.ajax({
				url: "/HospitalRegisteredPaymentSystemDoctorClient/doctor/cancellation",
				data: request.field,
				dataType: "json",
				type: "POST",
				success: function(data) {
					layer.open({
						title: data.result,
						content: data.content,
						btn: "确定",
						yes: function() {
							if(data.redirect != "") {
								window.location.href=data.redirect;
							}
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