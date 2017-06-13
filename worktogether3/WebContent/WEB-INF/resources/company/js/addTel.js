var index=0;
$(function(){
	//岗位控制
	index=($("#connectionIndex").val())-1;
	$("#addTel").click(function(){
		var maxjob=5;
		if(index<maxjob){
			if(window.confirm("确定要增加职务吗?")){
				index++;
				$(".companyTel:eq(0)").clone(false).show().insertBefore($(".newTel"));
				$("#deleteTel").css("display","block");
				/*$("#addInput").find(":input:last").val();*/
				$("#addInput").find(".companyTel:last").find(":input").val("");
			}
		}else{
			alert("您的权限最多只能添加"+(maxjob+1)+"个岗位");
		}
		//清空clone内容的value值
		
		$("#addInput").find(".connectionName").attr("name","addConnectionNames");
		$("#addInput").find(".companyTels").attr("name","addCompanyTels");
		$("#addInput").find(".ids").attr("name","");
		$("#addInput").find("#deleteConnection").css("display","none");
	});
	//删除最后一个岗位
	$("#deleteTel").click(function(){
		if($(".companyTel").length>1){
			if(window.confirm("确定要删 除最后一个职务栏?")){
				$(".companyTel:last").remove();
				index--;
			}
		}
		if($(".companyTel").length==1){
			$("#deleteTel").css("display","none");
		}
	});
	
});

var deletePhonefunction=function(div){
	div.hide();
	var i=div.find(".ids");
	i.attr("name","deleteIds");
	index-=1;
	div.find(".connectionName").attr("name","");
	div.find(".companyTels").attr("name","");
	if(index==0){
		$("#deleteTel").css("display","none");
	}
}