//更改岗位（删除岗位生效！）
$(function(){
	//岗位控制
	//现有岗位长度
	var index=$(".jobIds").length;
	$("#addjob").click(function(){
		var maxjob=5;
		if(index<maxjob){
			if(window.confirm("确定要增加职务吗?")){
				index++;
				$(".onejob:eq(0)").clone(true).insertBefore($(".newjob"));
				$("#deletejob").css("display","block");
				//控制台打印
				console.log($(".onejob").length);
			}
		}else{
			alert("您的权限最多只能添加"+(maxjob+1)+"个岗位");
		}
	});
	//删除最后一个岗位
	$("#deletejob").click(function(){
		if($(".onejob").length>1){
			if(window.confirm("确定要删除最后一个职务栏?")){
				if(index==$(".onejob").length){
					var jobId = $(".jobIds:last").val;
					$.ajax({
						type:"GET",
						url:"crowdfund/deleteJob",
						data:{"jobId":jobId},
						dataType:"json",
						success:function(data){
						}
					});
					$(".onejob:last").remove();
					index--;
					//获取当前setId删除
					
				}
				$(".onejob:last").remove();
				index--;
			}
		}
		if($(".onejob").length==1){
			$("#deletejob").css("display","none");
		}
	});
	//
	
	//获取点击对象
	$("#job1 option").click(function(){
		 
		var that = $(this).parent().next();
		console.log($("#job1").val());
		var jobName = $(this).val();
		if(jobName!=null||jobName!=""){
			$.ajax({
				type:"GET",
				url:"crowdfund/job1",
				data:{"jobName":jobName},
				dataType:"json",
				success:function(data){
					console.log("数组："+data);
					var content=null;
					for(var i=0;i<data.length;i++){
						that.css("display","block");
						content += "<option style='height:33px;' value='"+data[i]+"'>"+data[i]+"</option>";
					}
					that.html(content);
					
				}
			});
		}
	});
	
	//添加众筹信息验证
	$("#addCf").bootstrapValidator({
		 message:"内容无效",
		 feedbackIcons: {        //提示图标
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		 },
		 fields:{
			 //项目名称验证
			 crowdfundProjectName:{
				 validators:{
					 //非空验证
					 notEmpty:{
						 message:"项目名称不能为空！"
					 },
					 stringLength: {
                         min: 3,
                         max: 50,
                         message: '名称长度必须在3~50字符以内'
                     }
				 }
			 },
			 //项目金额
			 crowdfundProjectMoney:{
				 validators:{
					 notEmpty:{
						 message: '项目金额不能为空！'
					 },
					 //验证金额
					 regexp: {
	                     regexp: /^\d{2,11}$/,
	                     message: '项目金额只能为数字！'
	                 }
				 }
			 },
			 //项目周期
			 crowdfundProjectCycle:{
				 validators:{
					 //非空验证
					 notEmpty:{
						 message:"项目周期不能为空！"
					 }
				 }
			 },
			 //项目结束时间
			 crowdfundProjectEndDate:{
				 validators:{
					 //非空验证
					 notEmpty:{
						 message:"时间不为空！"
					 }
				 }
			 },
			 //项目简介
			 crowdfundProjectSummary:{
				 validators:{
					 notEmpty:{
						 message:"项目简介不为空！"
					 },
					 stringLength: {
                         max: 500,
                         message: '简介长度必须在500字符以内！'
                     }
				 }
			 },
			 //项目众筹办法
			 crowdfundProjectMethod:{
				 validators:{
					 notEmpty:{
						 message:"众筹方式不能为空！"
					 },
					 stringLength:{
						 max:2000,
						 message:'众筹办法内容必须在2000字符以内！'
					 }
				 }
			 },
			 //需求人数
			 demandPeopleCount:{
				 validators:{
					 notEmpty:{
						 message:'人数不能为空！'
					 },
					 regexp: {
	                     regexp: /^[1-9]\d{0,1}$/,
	                     message: '只能为数字，范围（1-99）！'
	                 }
				 }
			 },
			 //岗位描述
			 demandSummary:{
				 validators:{
					 notEmpty:{
						 message:'描述不为空！'
					 },
					 stringLength:{
						 max:500,
						 message:'岗位描述必须在500字符以内！'
					 }
				 }
			 }
		 }
	});
});