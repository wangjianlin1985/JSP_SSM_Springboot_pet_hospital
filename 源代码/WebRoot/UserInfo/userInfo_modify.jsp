<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInfo.css" />
<div id="userInfo_editDiv">
	<form id="userInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">用户名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_user_name_edit" name="userInfo.user_name" value="<%=request.getParameter("user_name") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">登录密码:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_password_edit" name="userInfo.password" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">宠物类别:</span>
			<span class="inputControl">
				<input class="textbox"  id="userInfo_petClassObj_petClassId_edit" name="userInfo.petClassObj.petClassId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">宠物昵称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_nicheng_edit" name="userInfo.nicheng" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">宠物照片:</span>
			<span class="inputControl">
				<img id="userInfo_petPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="userInfo_petPhoto" name="userInfo.petPhoto"/>
				<input id="petPhotoFile" name="petPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">性别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_gender_edit" name="userInfo.gender" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">体型:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_tixing_edit" name="userInfo.tixing" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">体重:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_weight_edit" name="userInfo.weight" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出生日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_birthDate_edit" name="userInfo.birthDate" />

			</span>

		</div>
		<div>
			<span class="label">是否接种疫苗:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_sfym_edit" name="userInfo.sfym" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">主人姓名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_name_edit" name="userInfo.name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_telephone_edit" name="userInfo.telephone" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">邮件:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_email_edit" name="userInfo.email" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">备注信息:</span>
			<span class="inputControl">
				<textarea id="userInfo_memo_edit" name="userInfo.memo" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">注册时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_regTime_edit" name="userInfo.regTime" />

			</span>

		</div>
		<div class="operation">
			<a id="userInfoModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/UserInfo/js/userInfo_modify.js"></script> 
