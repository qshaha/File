$(function() {
	layui.use(["element", "form", "laypage"], function(){
		
	});
	$("#div1").on("mouseover", function() {
		$("button").css("display", "");
	});
	$("#div1").on("mouseout", function() {
		$("button").css("display", "none");
	});
});