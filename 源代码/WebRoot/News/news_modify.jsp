<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/news.css" />
<div id="news_editDiv">
	<form id="newsEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">资讯id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="news_newsId_edit" name="news.newsId" value="<%=request.getParameter("newsId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">资讯分类:</span>
			<span class="inputControl">
				<input class="textbox"  id="news_newsClassObj_newsClassId_edit" name="news.newsClassObj.newsClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">资讯标题:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="news_title_edit" name="news.title" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">宠物分类:</span>
			<span class="inputControl">
				<input class="textbox"  id="news_petClassObj_petClassId_edit" name="news.petClassObj.petClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">宠物体型:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="news_tixing_edit" name="news.tixing" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">资讯内容:</span>
			<span class="inputControl">
				<script id="news_content_edit" name="news.content" type="text/plain"   style="width:750px;height:500px;"></script>

			</span>

		</div>
		<div>
			<span class="label">发布时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="news_publishDate_edit" name="news.publishDate" />

			</span>

		</div>
		<div class="operation">
			<a id="newsModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/News/js/news_modify.js"></script> 
