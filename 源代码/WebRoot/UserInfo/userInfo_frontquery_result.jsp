<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page import="com.chengxusheji.po.PetClass" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    //获取所有的petClassObj信息
    List<PetClass> petClassList = (List<PetClass>)request.getAttribute("petClassList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String user_name = (String)request.getAttribute("user_name"); //用户名查询关键字
    PetClass petClassObj = (PetClass)request.getAttribute("petClassObj");
    String nicheng = (String)request.getAttribute("nicheng"); //宠物昵称查询关键字
    String birthDate = (String)request.getAttribute("birthDate"); //出生日期查询关键字
    String sfym = (String)request.getAttribute("sfym"); //是否接种疫苗查询关键字
    String name = (String)request.getAttribute("name"); //主人姓名查询关键字
    String telephone = (String)request.getAttribute("telephone"); //联系电话查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>用户查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>UserInfo/frontlist">用户信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>UserInfo/userInfo_frontAdd.jsp" style="display:none;">添加用户</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<userInfoList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		UserInfo userInfo = userInfoList.get(i); //获取到用户对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>UserInfo/<%=userInfo.getUser_name() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=userInfo.getPetPhoto()%>" /></a>
			     <div class="showFields">
			     	<div class="field" style="display:none;">
	            		用户名:<%=userInfo.getUser_name() %>
			     	</div>
			     	<div class="field">
	            		宠物类别:<%=userInfo.getPetClassObj().getPetClassName() %>
			     	</div>
			     	<div class="field">
	            		宠物昵称:<%=userInfo.getNicheng() %>
			     	</div>
			     	<div class="field">
	            		性别:<%=userInfo.getGender() %>
			     	</div>
			     	<div class="field">
	            		体型:<%=userInfo.getTixing() %>
			     	</div>
			     	<div class="field">
	            		体重:<%=userInfo.getWeight() %>
			     	</div>
			     	<div class="field">
	            		出生日期:<%=userInfo.getBirthDate() %>
			     	</div>
			     	<div class="field" style="display:none;">
	            		是否接种疫苗:<%=userInfo.getSfym() %>
			     	</div>
			     	<div class="field" style="display:none;">
	            		主人姓名:<%=userInfo.getName() %>
			     	</div>
			     	<div class="field" style="display:none;">
	            		联系电话:<%=userInfo.getTelephone() %>
			     	</div>
			     	<div class="field" style="display:none;">
	            		邮件:<%=userInfo.getEmail() %>
			     	</div>
			     	<div class="field" style="display:none;">
	            		注册时间:<%=userInfo.getRegTime() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>UserInfo/<%=userInfo.getUser_name() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="userInfoEdit('<%=userInfo.getUser_name() %>');" style="display:none;">修改</a>
			        <a class="btn btn-primary top5" onclick="userInfoDelete('<%=userInfo.getUser_name() %>');" style="display:none;">删除</a>
			     </div>
			</div>
			<%  } %>

			<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<%
								int startPage = currentPage - 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %> 
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>用户查询</h1>
		</div>
		<form name="userInfoQueryForm" id="userInfoQueryForm" action="<%=basePath %>UserInfo/frontlist" class="mar_t15" method="post">
			<div class="form-group">
				<label for="user_name">用户名:</label>
				<input type="text" id="user_name" name="user_name" value="<%=user_name %>" class="form-control" placeholder="请输入用户名">
			</div>
            <div class="form-group">
            	<label for="petClassObj_petClassId">宠物类别：</label>
                <select id="petClassObj_petClassId" name="petClassObj.petClassId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(PetClass petClassTemp:petClassList) {
	 					String selected = "";
 					if(petClassObj!=null && petClassObj.getPetClassId()!=null && petClassObj.getPetClassId().intValue()==petClassTemp.getPetClassId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=petClassTemp.getPetClassId() %>" <%=selected %>><%=petClassTemp.getPetClassName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="nicheng">宠物昵称:</label>
				<input type="text" id="nicheng" name="nicheng" value="<%=nicheng %>" class="form-control" placeholder="请输入宠物昵称">
			</div>
			<div class="form-group">
				<label for="birthDate">出生日期:</label>
				<input type="text" id="birthDate" name="birthDate" class="form-control"  placeholder="请选择出生日期" value="<%=birthDate %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
			<div class="form-group">
				<label for="sfym">是否接种疫苗:</label>
				<input type="text" id="sfym" name="sfym" value="<%=sfym %>" class="form-control" placeholder="请输入是否接种疫苗">
			</div>
			<div class="form-group">
				<label for="name">主人姓名:</label>
				<input type="text" id="name" name="name" value="<%=name %>" class="form-control" placeholder="请输入主人姓名">
			</div>
			<div class="form-group">
				<label for="telephone">联系电话:</label>
				<input type="text" id="telephone" name="telephone" value="<%=telephone %>" class="form-control" placeholder="请输入联系电话">
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="userInfoEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;用户信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
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
		  <div class="form-group">
		  	 <label for="userInfo_regTime_edit" class="col-md-3 text-right">注册时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date userInfo_regTime_edit col-md-12" data-link-field="userInfo_regTime_edit">
                    <input class="form-control" id="userInfo_regTime_edit" name="userInfo.regTime" size="16" type="text" value="" placeholder="请选择注册时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		</form> 
	    <style>#userInfoEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxUserInfoModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.userInfoQueryForm.currentPage.value = currentPage;
    document.userInfoQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.userInfoQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.userInfoQueryForm.currentPage.value = pageValue;
    documentuserInfoQueryForm.submit();
}

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
				$('#userInfoEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除用户信息*/
function userInfoDelete(user_name) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "UserInfo/deletes",
			data : {
				user_names : user_name,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#userInfoQueryForm").submit();
					//location.href= basePath + "UserInfo/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
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
})
</script>
</body>
</html>

