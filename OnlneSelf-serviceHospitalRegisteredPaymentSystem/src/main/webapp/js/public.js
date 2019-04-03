$(function() {
	$("a[name='heada']").hover(function() {
		$("#headtable").css("z-index","-1");
	}, function() {
		$("#headtable").css("z-index","5");
	});
});
$(function() {
	setInterval(function(){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var h = date.getHours();
		var m = date.getMinutes();
		var s = date.getSeconds();
		$("p[name='nowtime']").text("当前时间：" + year+'-'+month+"-"+day+" "+h+':'+m+":"+s);
	},1000);
});