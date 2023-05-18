<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInfo.css" />
<div id="userInfoAddDiv">
	<form id="userInfoAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">用户名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_user_name" name="userInfo.user_name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">登录密码:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_password" name="userInfo.password" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">宠物类别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_petClassObj_petClassId" name="userInfo.petClassObj.petClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">宠物昵称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_nicheng" name="userInfo.nicheng" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">宠物照片:</span>
			<span class="inputControl">
				<input id="petPhotoFile" name="petPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">性别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_gender" name="userInfo.gender" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">体型:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_tixing" name="userInfo.tixing" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">体重:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_weight" name="userInfo.weight" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出生日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_birthDate" name="userInfo.birthDate" />

			</span>

		</div>
		<div>
			<span class="label">是否接种疫苗:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_sfym" name="userInfo.sfym" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">主人姓名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_name" name="userInfo.name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_telephone" name="userInfo.telephone" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">邮件:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_email" name="userInfo.email" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">备注信息:</span>
			<span class="inputControl">
				<textarea id="userInfo_memo" name="userInfo.memo" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">注册时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_regTime" name="userInfo.regTime" />

			</span>

		</div>
		<div class="operation">
			<a id="userInfoAddButton" class="easyui-linkbutton">添加</a>
			<a id="userInfoClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/UserInfo/js/userInfo_add.js"></script> 
