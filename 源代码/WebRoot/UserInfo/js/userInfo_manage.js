var userInfo_manage_tool = null; 
$(function () { 
	initUserInfoManageTool(); //建立UserInfo管理对象
	userInfo_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#userInfo_manage").datagrid({
		url : 'UserInfo/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "user_name",
		sortOrder : "desc",
		toolbar : "#userInfo_manage_tool",
		columns : [[
			{
				field : "user_name",
				title : "用户名",
				width : 140,
			},
			{
				field : "petClassObj",
				title : "宠物类别",
				width : 140,
			},
			{
				field : "nicheng",
				title : "宠物昵称",
				width : 140,
			},
			{
				field : "petPhoto",
				title : "宠物照片",
				width : "70px",
				height: "65px",
				formatter: function(val,row) {
					return "<img src='" + val + "' width='65px' height='55px' />";
				}
 			},
			{
				field : "gender",
				title : "性别",
				width : 140,
			},
			{
				field : "tixing",
				title : "体型",
				width : 140,
			},
			{
				field : "weight",
				title : "体重",
				width : 140,
			},
			{
				field : "birthDate",
				title : "出生日期",
				width : 140,
			},
			{
				field : "sfym",
				title : "是否接种疫苗",
				width : 140,
			},
			{
				field : "name",
				title : "主人姓名",
				width : 140,
			},
			{
				field : "telephone",
				title : "联系电话",
				width : 140,
			},
			{
				field : "email",
				title : "邮件",
				width : 140,
			},
			{
				field : "regTime",
				title : "注册时间",
				width : 140,
			},
		]],
	});

	$("#userInfoEditDiv").dialog({
		title : "修改管理",
		top: "50px",
		width : 700,
		height : 515,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#userInfoEditForm").form("validate")) {
					//验证表单 
					if(!$("#userInfoEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#userInfoEditForm").form({
						    url:"UserInfo/" + $("#userInfo_user_name_edit").val() + "/update",
						    onSubmit: function(){
								if($("#userInfoEditForm").form("validate"))  {
				                	$.messager.progress({
										text : "正在提交数据中...",
									});
				                	return true;
				                } else { 
				                    return false; 
				                }
						    },
						    success:function(data){
						    	$.messager.progress("close");
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#userInfoEditDiv").dialog("close");
			                        userInfo_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#userInfoEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#userInfoEditDiv").dialog("close");
				$("#userInfoEditForm").form("reset"); 
			},
		}],
	});
});

function initUserInfoManageTool() {
	userInfo_manage_tool = {
		init: function() {
			$.ajax({
				url : "PetClass/listAll",
				type : "post",
				success : function (data, response, status) {
					$("#petClassObj_petClassId_query").combobox({ 
					    valueField:"petClassId",
					    textField:"petClassName",
					    panelHeight: "200px",
				        editable: false, //不允许手动输入 
					});
					data.splice(0,0,{petClassId:0,petClassName:"不限制"});
					$("#petClassObj_petClassId_query").combobox("loadData",data); 
				}
			});
		},
		reload : function () {
			$("#userInfo_manage").datagrid("reload");
		},
		redo : function () {
			$("#userInfo_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#userInfo_manage").datagrid("options").queryParams;
			queryParams["user_name"] = $("#user_name").val();
			queryParams["petClassObj.petClassId"] = $("#petClassObj_petClassId_query").combobox("getValue");
			queryParams["nicheng"] = $("#nicheng").val();
			queryParams["birthDate"] = $("#birthDate").datebox("getValue"); 
			queryParams["sfym"] = $("#sfym").val();
			queryParams["name"] = $("#name").val();
			queryParams["telephone"] = $("#telephone").val();
			$("#userInfo_manage").datagrid("options").queryParams=queryParams; 
			$("#userInfo_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#userInfoQueryForm").form({
			    url:"UserInfo/OutToExcel",
			});
			//提交表单
			$("#userInfoQueryForm").submit();
		},
		remove : function () {
			var rows = $("#userInfo_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var user_names = [];
						for (var i = 0; i < rows.length; i ++) {
							user_names.push(rows[i].user_name);
						}
						$.ajax({
							type : "POST",
							url : "UserInfo/deletes",
							data : {
								user_names : user_names.join(","),
							},
							beforeSend : function () {
								$("#userInfo_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#userInfo_manage").datagrid("loaded");
									$("#userInfo_manage").datagrid("load");
									$("#userInfo_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#userInfo_manage").datagrid("loaded");
									$("#userInfo_manage").datagrid("load");
									$("#userInfo_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function () {
			var rows = $("#userInfo_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "UserInfo/" + rows[0].user_name +  "/update",
					type : "get",
					data : {
						//user_name : rows[0].user_name,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (userInfo, response, status) {
						$.messager.progress("close");
						if (userInfo) { 
							$("#userInfoEditDiv").dialog("open");
							$("#userInfo_user_name_edit").val(userInfo.user_name);
							$("#userInfo_user_name_edit").validatebox({
								required : true,
								missingMessage : "请输入用户名",
								editable: false
							});
							$("#userInfo_password_edit").val(userInfo.password);
							$("#userInfo_password_edit").validatebox({
								required : true,
								missingMessage : "请输入登录密码",
							});
							$("#userInfo_petClassObj_petClassId_edit").combobox({
								url:"PetClass/listAll",
							    valueField:"petClassId",
							    textField:"petClassName",
							    panelHeight: "auto",
						        editable: false, //不允许手动输入 
						        onLoadSuccess: function () { //数据加载完毕事件
									$("#userInfo_petClassObj_petClassId_edit").combobox("select", userInfo.petClassObjPri);
									//var data = $("#userInfo_petClassObj_petClassId_edit").combobox("getData"); 
						            //if (data.length > 0) {
						                //$("#userInfo_petClassObj_petClassId_edit").combobox("select", data[0].petClassId);
						            //}
								}
							});
							$("#userInfo_nicheng_edit").val(userInfo.nicheng);
							$("#userInfo_nicheng_edit").validatebox({
								required : true,
								missingMessage : "请输入宠物昵称",
							});
							$("#userInfo_petPhoto").val(userInfo.petPhoto);
							$("#userInfo_petPhotoImg").attr("src", userInfo.petPhoto);
							$("#userInfo_gender_edit").val(userInfo.gender);
							$("#userInfo_gender_edit").validatebox({
								required : true,
								missingMessage : "请输入性别",
							});
							$("#userInfo_tixing_edit").val(userInfo.tixing);
							$("#userInfo_tixing_edit").validatebox({
								required : true,
								missingMessage : "请输入体型",
							});
							$("#userInfo_weight_edit").val(userInfo.weight);
							$("#userInfo_weight_edit").validatebox({
								required : true,
								missingMessage : "请输入体重",
							});
							$("#userInfo_birthDate_edit").datebox({
								value: userInfo.birthDate,
							    required: true,
							    showSeconds: true,
							});
							$("#userInfo_sfym_edit").val(userInfo.sfym);
							$("#userInfo_sfym_edit").validatebox({
								required : true,
								missingMessage : "请输入是否接种疫苗",
							});
							$("#userInfo_name_edit").val(userInfo.name);
							$("#userInfo_name_edit").validatebox({
								required : true,
								missingMessage : "请输入主人姓名",
							});
							$("#userInfo_telephone_edit").val(userInfo.telephone);
							$("#userInfo_telephone_edit").validatebox({
								required : true,
								missingMessage : "请输入联系电话",
							});
							$("#userInfo_email_edit").val(userInfo.email);
							$("#userInfo_email_edit").validatebox({
								required : true,
								missingMessage : "请输入邮件",
							});
							$("#userInfo_memo_edit").val(userInfo.memo);
							$("#userInfo_regTime_edit").datetimebox({
								value: userInfo.regTime,
							    required: true,
							    showSeconds: true,
							});
						} else {
							$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
						}
					}
				});
			} else if (rows.length == 0) {
				$.messager.alert("警告操作！", "编辑记录至少选定一条数据！", "warning");
			}
		},
	};
}
