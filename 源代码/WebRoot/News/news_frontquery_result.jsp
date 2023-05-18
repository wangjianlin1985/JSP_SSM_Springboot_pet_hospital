<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.News" %>
<%@ page import="com.chengxusheji.po.NewsClass" %>
<%@ page import="com.chengxusheji.po.PetClass" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<News> newsList = (List<News>)request.getAttribute("newsList");
    //获取所有的newsClassObj信息
    List<NewsClass> newsClassList = (List<NewsClass>)request.getAttribute("newsClassList");
    //获取所有的petClassObj信息
    List<PetClass> petClassList = (List<PetClass>)request.getAttribute("petClassList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    NewsClass newsClassObj = (NewsClass)request.getAttribute("newsClassObj");
    String title = (String)request.getAttribute("title"); //资讯标题查询关键字
    PetClass petClassObj = (PetClass)request.getAttribute("petClassObj");
    String tixing = (String)request.getAttribute("tixing"); //宠物体型查询关键字
    String publishDate = (String)request.getAttribute("publishDate"); //发布时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>资讯信息查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="row"> 
		<div class="col-md-9 wow fadeInDown" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li><a href="<%=basePath %>index.jsp">首页</a></li>
			    	<li role="presentation" class="active"><a href="#newsListPanel" aria-controls="newsListPanel" role="tab" data-toggle="tab">资讯信息列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>News/news_frontAdd.jsp" style="display:none;">添加资讯信息</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="newsListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold"><td>序号</td><td>资讯分类</td><td>资讯标题</td><td>宠物分类</td><td>宠物体型</td><td>发布时间</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i=0;i<newsList.size();i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		News news = newsList.get(i); //获取到资讯信息对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=news.getNewsClassObj().getNewsClassName() %></td>
 											<td><%=news.getTitle() %></td>
 											<td><%=news.getPetClassObj().getPetClassName() %></td>
 											<td><%=news.getTixing() %></td>
 											<td><%=news.getPublishDate() %></td>
 											<td>
 												<a href="<%=basePath  %>News/<%=news.getNewsId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="newsEdit('<%=news.getNewsId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="newsDelete('<%=news.getNewsId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
 											</td> 
 										</tr>
 										<%}%>
				    				</table>
				    				</div>
				    			</div>
				    		</div>

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
			</div>
		</div>
	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>资讯信息查询</h1>
		</div>
		<form name="newsQueryForm" id="newsQueryForm" action="<%=basePath %>News/frontlist" class="mar_t15" method="post">
            <div class="form-group">
            	<label for="newsClassObj_newsClassId">资讯分类：</label>
                <select id="newsClassObj_newsClassId" name="newsClassObj.newsClassId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(NewsClass newsClassTemp:newsClassList) {
	 					String selected = "";
 					if(newsClassObj!=null && newsClassObj.getNewsClassId()!=null && newsClassObj.getNewsClassId().intValue()==newsClassTemp.getNewsClassId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=newsClassTemp.getNewsClassId() %>" <%=selected %>><%=newsClassTemp.getNewsClassName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="title">资讯标题:</label>
				<input type="text" id="title" name="title" value="<%=title %>" class="form-control" placeholder="请输入资讯标题">
			</div>






            <div class="form-group">
            	<label for="petClassObj_petClassId">宠物分类：</label>
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
				<label for="tixing">宠物体型:</label>
				<input type="text" id="tixing" name="tixing" value="<%=tixing %>" class="form-control" placeholder="请输入宠物体型">
			</div>






			<div class="form-group">
				<label for="publishDate">发布时间:</label>
				<input type="text" id="publishDate" name="publishDate" class="form-control"  placeholder="请选择发布时间" value="<%=publishDate %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
	</div> 
<div id="newsEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="width:900px;" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;资讯信息信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="newsEditForm" id="newsEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="news_newsId_edit" class="col-md-3 text-right">资讯id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="news_newsId_edit" name="news.newsId" class="form-control" placeholder="请输入资讯id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="news_newsClassObj_newsClassId_edit" class="col-md-3 text-right">资讯分类:</label>
		  	 <div class="col-md-9">
			    <select id="news_newsClassObj_newsClassId_edit" name="news.newsClassObj.newsClassId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="news_title_edit" class="col-md-3 text-right">资讯标题:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="news_title_edit" name="news.title" class="form-control" placeholder="请输入资讯标题">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="news_petClassObj_petClassId_edit" class="col-md-3 text-right">宠物分类:</label>
		  	 <div class="col-md-9">
			    <select id="news_petClassObj_petClassId_edit" name="news.petClassObj.petClassId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="news_tixing_edit" class="col-md-3 text-right">宠物体型:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="news_tixing_edit" name="news.tixing" class="form-control" placeholder="请输入宠物体型">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="news_content_edit" class="col-md-3 text-right">资讯内容:</label>
		  	 <div class="col-md-9">
			 	<textarea name="news.content" id="news_content_edit" style="width:100%;height:500px;"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="news_publishDate_edit" class="col-md-3 text-right">发布时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date news_publishDate_edit col-md-12" data-link-field="news_publishDate_edit">
                    <input class="form-control" id="news_publishDate_edit" name="news.publishDate" size="16" type="text" value="" placeholder="请选择发布时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		</form> 
	    <style>#newsEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxNewsModify();">提交</button>
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
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var news_content_edit = UE.getEditor('news_content_edit'); //资讯内容编辑器
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.newsQueryForm.currentPage.value = currentPage;
    document.newsQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.newsQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.newsQueryForm.currentPage.value = pageValue;
    documentnewsQueryForm.submit();
}

/*弹出修改资讯信息界面并初始化数据*/
function newsEdit(newsId) {
	$.ajax({
		url :  basePath + "News/" + newsId + "/update",
		type : "get",
		dataType: "json",
		success : function (news, response, status) {
			if (news) {
				$("#news_newsId_edit").val(news.newsId);
				$.ajax({
					url: basePath + "NewsClass/listAll",
					type: "get",
					success: function(newsClasss,response,status) { 
						$("#news_newsClassObj_newsClassId_edit").empty();
						var html="";
		        		$(newsClasss).each(function(i,newsClass){
		        			html += "<option value='" + newsClass.newsClassId + "'>" + newsClass.newsClassName + "</option>";
		        		});
		        		$("#news_newsClassObj_newsClassId_edit").html(html);
		        		$("#news_newsClassObj_newsClassId_edit").val(news.newsClassObjPri);
					}
				});
				$("#news_title_edit").val(news.title);
				$.ajax({
					url: basePath + "PetClass/listAll",
					type: "get",
					success: function(petClasss,response,status) { 
						$("#news_petClassObj_petClassId_edit").empty();
						var html="";
		        		$(petClasss).each(function(i,petClass){
		        			html += "<option value='" + petClass.petClassId + "'>" + petClass.petClassName + "</option>";
		        		});
		        		$("#news_petClassObj_petClassId_edit").html(html);
		        		$("#news_petClassObj_petClassId_edit").val(news.petClassObjPri);
					}
				});
				$("#news_tixing_edit").val(news.tixing);
				news_content_edit.setContent(news.content, false);
				$("#news_publishDate_edit").val(news.publishDate);
				$('#newsEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除资讯信息信息*/
function newsDelete(newsId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "News/deletes",
			data : {
				newsIds : newsId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#newsQueryForm").submit();
					//location.href= basePath + "News/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交资讯信息信息表单给服务器端修改*/
function ajaxNewsModify() {
	$.ajax({
		url :  basePath + "News/" + $("#news_newsId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#newsEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#newsQueryForm").submit();
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

    /*发布时间组件*/
    $('.news_publishDate_edit').datetimepicker({
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

