<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.NewsClass" %>
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
<title>资讯信息添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-12 wow fadeInUp" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li role="presentation" ><a href="<%=basePath %>News/frontlist">资讯信息列表</a></li>
			    	<li role="presentation" class="active"><a href="#newsAdd" aria-controls="newsAdd" role="tab" data-toggle="tab">添加资讯信息</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" class="tab-pane" id="newsList">
				    </div>
				    <div role="tabpanel" class="tab-pane active" id="newsAdd"> 
				      	<form class="form-horizontal" name="newsAddForm" id="newsAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
						  <div class="form-group">
						  	 <label for="news_newsClassObj_newsClassId" class="col-md-2 text-right">资讯分类:</label>
						  	 <div class="col-md-8">
							    <select id="news_newsClassObj_newsClassId" name="news.newsClassObj.newsClassId" class="form-control">
							    </select>
						  	 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="news_title" class="col-md-2 text-right">资讯标题:</label>
						  	 <div class="col-md-8">
							    <input type="text" id="news_title" name="news.title" class="form-control" placeholder="请输入资讯标题">
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="news_petClassObj_petClassId" class="col-md-2 text-right">宠物分类:</label>
						  	 <div class="col-md-8">
							    <select id="news_petClassObj_petClassId" name="news.petClassObj.petClassId" class="form-control">
							    </select>
						  	 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="news_tixing" class="col-md-2 text-right">宠物体型:</label>
						  	 <div class="col-md-8">
							    <input type="text" id="news_tixing" name="news.tixing" class="form-control" placeholder="请输入宠物体型">
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="news_content" class="col-md-2 text-right">资讯内容:</label>
						  	 <div class="col-md-8">
							    <textarea name="news.content" id="news_content" style="width:100%;height:500px;"></textarea>
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="news_publishDateDiv" class="col-md-2 text-right">发布时间:</label>
						  	 <div class="col-md-8">
				                <div id="news_publishDateDiv" class="input-group date news_publishDate col-md-12" data-link-field="news_publishDate">
				                    <input class="form-control" id="news_publishDate" name="news.publishDate" size="16" type="text" value="" placeholder="请选择发布时间" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
						  	 </div>
						  </div>
				          <div class="form-group">
				             <span class="col-md-2""></span>
				             <span onclick="ajaxNewsAdd();" class="btn btn-primary bottom5 top5">添加</span>
				          </div>
						</form> 
				        <style>#newsAddForm .form-group {margin:10px;}  </style>
					</div>
				</div>
			</div>
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
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var news_content_editor = UE.getEditor('news_content'); //资讯内容编辑器
var basePath = "<%=basePath%>";
	//提交添加资讯信息信息
	function ajaxNewsAdd() { 
		//提交之前先验证表单
		$("#newsAddForm").data('bootstrapValidator').validate();
		if(!$("#newsAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		if(news_content_editor.getContent() == "") {
			alert('资讯内容不能为空');
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "News/add",
			dataType : "json" , 
			data: new FormData($("#newsAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#newsAddForm").find("input").val("");
					$("#newsAddForm").find("textarea").val("");
					news_content_editor.setContent("");
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
	//验证资讯信息添加表单字段
	$('#newsAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"news.title": {
				validators: {
					notEmpty: {
						message: "资讯标题不能为空",
					}
				}
			},
			"news.tixing": {
				validators: {
					notEmpty: {
						message: "宠物体型不能为空",
					}
				}
			},
			"news.publishDate": {
				validators: {
					notEmpty: {
						message: "发布时间不能为空",
					}
				}
			},
		}
	}); 
	//初始化资讯分类下拉框值 
	$.ajax({
		url: basePath + "NewsClass/listAll",
		type: "get",
		success: function(newsClasss,response,status) { 
			$("#news_newsClassObj_newsClassId").empty();
			var html="";
    		$(newsClasss).each(function(i,newsClass){
    			html += "<option value='" + newsClass.newsClassId + "'>" + newsClass.newsClassName + "</option>";
    		});
    		$("#news_newsClassObj_newsClassId").html(html);
    	}
	});
	//初始化宠物分类下拉框值 
	$.ajax({
		url: basePath + "PetClass/listAll",
		type: "get",
		success: function(petClasss,response,status) { 
			$("#news_petClassObj_petClassId").empty();
			var html="";
    		$(petClasss).each(function(i,petClass){
    			html += "<option value='" + petClass.petClassId + "'>" + petClass.petClassName + "</option>";
    		});
    		$("#news_petClassObj_petClassId").html(html);
    	}
	});
	//发布时间组件
	$('#news_publishDateDiv').datetimepicker({
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
		$('#newsAddForm').data('bootstrapValidator').updateStatus('news.publishDate', 'NOT_VALIDATED',null).validateField('news.publishDate');
	});
})
</script>
</body>
</html>
