<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.PetClass" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>用户添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>UserInfo/frontlist">用户管理</a></li>
  			<li class="active">注册用户</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="userInfoAddForm" id="userInfoAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
					 <label for="userInfo_user_name" class="col-md-2 text-right">用户名:</label>
					 <div class="col-md-8"> 
					 	<input type="text" id="userInfo_user_name" name="userInfo.user_name" class="form-control" placeholder="请输入用户名">
					 </div>
				  </div> 
				  <div class="form-group">
				  	 <label for="userInfo_password" class="col-md-2 text-right">登录密码:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_password" name="userInfo.password" class="form-control" placeholder="请输入登录密码">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_petClassObj_petClassId" class="col-md-2 text-right">宠物类别:</label>
				  	 <div class="col-md-8">
					    <select id="userInfo_petClassObj_petClassId" name="userInfo.petClassObj.petClassId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_nicheng" class="col-md-2 text-right">宠物昵称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_nicheng" name="userInfo.nicheng" class="form-control" placeholder="请输入宠物昵称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_petPhoto" class="col-md-2 text-right">宠物照片:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="userInfo_petPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="userInfo_petPhoto" name="userInfo.petPhoto"/>
					    <input id="petPhotoFile" name="petPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_gender" class="col-md-2 text-right">性别:</label>
				  	 <div class="col-md-8">
				  	 	<select id="userInfo_gender" name="userInfo.gender" class="form-control">
				  	 		<option value="雄性">雄性</option>
				  	 		<option value="雌性">雌性</option>
				  	 	</select>
					     
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_tixing" class="col-md-2 text-right">体型:</label>
				  	 <div class="col-md-8">
					 	<select id="userInfo_tixing" name="userInfo.tixing" class="form-control">
					 		<option value="小型">小型</option>
					 		<option value="中型">中型</option>
					 		<option value="大型">大型</option>
					 	</select>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_weight" class="col-md-2 text-right">体重:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_weight" name="userInfo.weight" class="form-control" placeholder="请输入体重">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_birthDateDiv" class="col-md-2 text-right">出生日期:</label>
				  	 <div class="col-md-8">
		                <div id="userInfo_birthDateDiv" class="input-group date userInfo_birthDate col-md-12" data-link-field="userInfo_birthDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="userInfo_birthDate" name="userInfo.birthDate" size="16" type="text" value="" placeholder="请选择出生日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_sfym" class="col-md-2 text-right">是否接种疫苗:</label>
				  	 <div class="col-md-8">
					 	<select id="userInfo_sfym" name="userInfo.sfym" class="form-control">
					 		<option value="是">是</option>
					 		<option value="否">否</option>
					 	</select>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_name" class="col-md-2 text-right">主人姓名:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_name" name="userInfo.name" class="form-control" placeholder="请输入主人姓名">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_telephone" class="col-md-2 text-right">联系电话:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_telephone" name="userInfo.telephone" class="form-control" placeholder="请输入联系电话">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_email" class="col-md-2 text-right">邮件:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="userInfo_email" name="userInfo.email" class="form-control" placeholder="请输入邮件">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="userInfo_memo" class="col-md-2 text-right">备注信息:</label>
				  	 <div class="col-md-8">
					    <textarea id="userInfo_memo" name="userInfo.memo" rows="8" class="form-control" placeholder="请输入备注信息"></textarea>
					 </div>
				  </div>
				  <div class="form-group" style="display:none;">
				  	 <label for="userInfo_regTimeDiv" class="col-md-2 text-right">注册时间:</label>
				  	 <div class="col-md-8">
		                <div id="userInfo_regTimeDiv" class="input-group date userInfo_regTime col-md-12" data-link-field="userInfo_regTime">
		                    <input class="form-control" id="userInfo_regTime" name="userInfo.regTime" size="16" type="text" value="" placeholder="请选择注册时间" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxUserInfoAdd();" class="btn btn-primary bottom5 top5">开始注册</span>
		          </div> 
		          <style>#userInfoAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
var basePath = "<%=basePath%>";
	//提交添加用户信息
	function ajaxUserInfoAdd() { 
		//提交之前先验证表单
		$("#userInfoAddForm").data('bootstrapValidator').validate();
		if(!$("#userInfoAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "UserInfo/add",
			dataType : "json" , 
			data: new FormData($("#userInfoAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("注册成功！");
					$("#userInfoAddForm").find("input").val("");
					$("#userInfoAddForm").find("textarea").val("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证用户添加表单字段
	$('#userInfoAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"userInfo.user_name": {
				validators: {
					notEmpty: {
						message: "用户名不能为空",
					}
				}
			},
			"userInfo.password": {
				validators: {
					notEmpty: {
						message: "登录密码不能为空",
					}
				}
			},
			"userInfo.nicheng": {
				validators: {
					notEmpty: {
						message: "宠物昵称不能为空",
					}
				}
			},
			"userInfo.gender": {
				validators: {
					notEmpty: {
						message: "性别不能为空",
					}
				}
			},
			"userInfo.tixing": {
				validators: {
					notEmpty: {
						message: "体型不能为空",
					}
				}
			},
			"userInfo.weight": {
				validators: {
					notEmpty: {
						message: "体重不能为空",
					}
				}
			},
			"userInfo.birthDate": {
				validators: {
					notEmpty: {
						message: "出生日期不能为空",
					}
				}
			},
			"userInfo.sfym": {
				validators: {
					notEmpty: {
						message: "是否接种疫苗不能为空",
					}
				}
			},
			"userInfo.name": {
				validators: {
					notEmpty: {
						message: "主人姓名不能为空",
					}
				}
			},
			"userInfo.telephone": {
				validators: {
					notEmpty: {
						message: "联系电话不能为空",
					}
				}
			},
			"userInfo.email": {
				validators: {
					notEmpty: {
						message: "邮件不能为空",
					}
				}
			},
			 
		}
	}); 
	//初始化宠物类别下拉框值 
	$.ajax({
		url: basePath + "PetClass/listAll",
		type: "get",
		success: function(petClasss,response,status) { 
			$("#userInfo_petClassObj_petClassId").empty();
			var html="";
    		$(petClasss).each(function(i,petClass){
    			html += "<option value='" + petClass.petClassId + "'>" + petClass.petClassName + "</option>";
    		});
    		$("#userInfo_petClassObj_petClassId").html(html);
    	}
	});
	//出生日期组件
	$('#userInfo_birthDateDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd',
		minView: 2,
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#userInfoAddForm').data('bootstrapValidator').updateStatus('userInfo.birthDate', 'NOT_VALIDATED',null).validateField('userInfo.birthDate');
	});
	//注册时间组件
	$('#userInfo_regTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#userInfoAddForm').data('bootstrapValidator').updateStatus('userInfo.regTime', 'NOT_VALIDATED',null).validateField('userInfo.regTime');
	});
})
</script>
</body>
</html>
