<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page import="com.chengxusheji.po.PetClass" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的petClassObj信息
    List<PetClass> petClassList = (List<PetClass>)request.getAttribute("petClassList");
    UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改用户信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">用户信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="userInfoEditForm" id="userInfoEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="userInfo_user_name_edit" class="col-md-3 text-right">用户名:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="userInfo_user_name_edit" name="userInfo.user_name" class="form-control" placeholder="请输入用户名" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="userInfo_password_edit" class="col-md-3 text-right">登录密码:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_password_edit" name="userInfo.password" class="form-control" placeholder="请输入登录密码">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_petClassObj_petClassId_edit" class="col-md-3 text-right">宠物类别:</label>
		  	 <div class="col-md-9">
			    <select id="userInfo_petClassObj_petClassId_edit" name="userInfo.petClassObj.petClassId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_nicheng_edit" class="col-md-3 text-right">宠物昵称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_nicheng_edit" name="userInfo.nicheng" class="form-control" placeholder="请输入宠物昵称">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_petPhoto_edit" class="col-md-3 text-right">宠物照片:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="userInfo_petPhotoImg" border="0px"/><br/>
			    <input type="hidden" id="userInfo_petPhoto" name="userInfo.petPhoto"/>
			    <input id="petPhotoFile" name="petPhotoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_gender_edit" class="col-md-3 text-right">性别:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_gender_edit" name="userInfo.gender" class="form-control" placeholder="请输入性别">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_tixing_edit" class="col-md-3 text-right">体型:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_tixing_edit" name="userInfo.tixing" class="form-control" placeholder="请输入体型">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_weight_edit" class="col-md-3 text-right">体重:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_weight_edit" name="userInfo.weight" class="form-control" placeholder="请输入体重">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_birthDate_edit" class="col-md-3 text-right">出生日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date userInfo_birthDate_edit col-md-12" data-link-field="userInfo_birthDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="userInfo_birthDate_edit" name="userInfo.birthDate" size="16" type="text" value="" placeholder="请选择出生日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_sfym_edit" class="col-md-3 text-right">是否接种疫苗:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_sfym_edit" name="userInfo.sfym" class="form-control" placeholder="请输入是否接种疫苗">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_name_edit" class="col-md-3 text-right">主人姓名:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_name_edit" name="userInfo.name" class="form-control" placeholder="请输入主人姓名">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_telephone_edit" class="col-md-3 text-right">联系电话:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_telephone_edit" name="userInfo.telephone" class="form-control" placeholder="请输入联系电话">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_email_edit" class="col-md-3 text-right">邮件:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_email_edit" name="userInfo.email" class="form-control" placeholder="请输入邮件">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_memo_edit" class="col-md-3 text-right">备注信息:</label>
		  	 <div class="col-md-9">
			    <textarea id="userInfo_memo_edit" name="userInfo.memo" rows="8" class="form-control" placeholder="请输入备注信息"></textarea>
			 </div>
		  </div>
		  <div class="form-group" style="display:none;">
		  	 <label for="userInfo_regTime_edit" class="col-md-3 text-right">注册时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date userInfo_regTime_edit col-md-12" data-link-field="userInfo_regTime_edit">
                    <input class="form-control" id="userInfo_regTime_edit" name="userInfo.regTime" size="16" type="text" value="" placeholder="请选择注册时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxUserInfoModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#userInfoEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*弹出修改用户界面并初始化数据*/
function userInfoEdit(user_name) {
	$.ajax({
		url :  basePath + "UserInfo/" + user_name + "/update",
		type : "get",
		dataType: "json",
		success : function (userInfo, response, status) {
			if (userInfo) {
				$("#userInfo_user_name_edit").val(userInfo.user_name);
				$("#userInfo_password_edit").val(userInfo.password);
				$.ajax({
					url: basePath + "PetClass/listAll",
					type: "get",
					success: function(petClasss,response,status) { 
						$("#userInfo_petClassObj_petClassId_edit").empty();
						var html="";
		        		$(petClasss).each(function(i,petClass){
		        			html += "<option value='" + petClass.petClassId + "'>" + petClass.petClassName + "</option>";
		        		});
		        		$("#userInfo_petClassObj_petClassId_edit").html(html);
		        		$("#userInfo_petClassObj_petClassId_edit").val(userInfo.petClassObjPri);
					}
				});
				$("#userInfo_nicheng_edit").val(userInfo.nicheng);
				$("#userInfo_petPhoto").val(userInfo.petPhoto);
				$("#userInfo_petPhotoImg").attr("src", basePath +　userInfo.petPhoto);
				$("#userInfo_gender_edit").val(userInfo.gender);
				$("#userInfo_tixing_edit").val(userInfo.tixing);
				$("#userInfo_weight_edit").val(userInfo.weight);
				$("#userInfo_birthDate_edit").val(userInfo.birthDate);
				$("#userInfo_sfym_edit").val(userInfo.sfym);
				$("#userInfo_name_edit").val(userInfo.name);
				$("#userInfo_telephone_edit").val(userInfo.telephone);
				$("#userInfo_email_edit").val(userInfo.email);
				$("#userInfo_memo_edit").val(userInfo.memo);
				$("#userInfo_regTime_edit").val(userInfo.regTime);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交用户信息表单给服务器端修改*/
function ajaxUserInfoModify() {
	$.ajax({
		url :  basePath + "UserInfo/" + $("#userInfo_user_name_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#userInfoEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#userInfoQueryForm").submit();
            }else{
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
    /*出生日期组件*/
    $('.userInfo_birthDate_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    /*注册时间组件*/
    $('.userInfo_regTime_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd hh:ii:ss',
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    userInfoEdit("<%=session.getAttribute("user_name")%>");
 })
 </script> 
</body>
</html>

