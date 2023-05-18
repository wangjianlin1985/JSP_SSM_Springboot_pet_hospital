var expert_manage_tool = null; 
$(function () { 
	initExpertManageTool(); //建立Expert管理对象
	expert_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#expert_manage").datagrid({
		url : 'Expert/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "expertUserName",
		sortOrder : "desc",
		toolbar : "#expert_manage_tool",
		columns : [[
			{
				field : "expertUserName",
				title : "专家账号",
				width : 140,
			},
			{
				field : "name",
				title : "姓名",
				width : 140,
			},
			{
				field : "gender",
				title : "性别",
				width : 140,
			},
			{
				field : "birthDate",
				title : "出生日期",
				width : 140,
			},
			{
				field : "expertPhoto",
				title : "专家照片",
				width : "70px",
				height: "65px",
				formatter: function(val,row) {
					return "<img src='" + val + "' width='65px' height='55px' />";
				}
 			},
			{
				field : "workExperience",
				title : "工作经验",
				width : 140,
			},
			{
				field : "telephone",
				title : "联系电话",
				width : 140,
			},
		]],
	});

	$("#expertEditDiv").dialog({
		title : "修改管理",
		top: "10px",
		width : 1000,
		height : 600,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#expertEditForm").form("validate")) {
					//验证表单 
					if(!$("#expertEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#expertEditForm").form({
						    url:"Expert/" + $("#expert_expertUserName_edit").val() + "/update",
						    onSubmit: function(){
								if($("#expertEditForm").form("validate"))  {
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
			                        $("#expertEditDiv").dialog("close");
			                        expert_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#expertEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#expertEditDiv").dialog("close");
				$("#expertEditForm").form("reset"); 
			},
		}],
	});
});

function initExpertManageTool() {
	expert_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#expert_manage").datagrid("reload");
		},
		redo : function () {
			$("#expert_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#expert_manage").datagrid("options").queryParams;
			queryParams["expertUserName"] = $("#expertUserName").val();
			queryParams["name"] = $("#name").val();
			queryParams["birthDate"] = $("#birthDate").datebox("getValue"); 
			queryParams["school"] = $("#school").val();
			queryParams["telephone"] = $("#telephone").val();
			$("#expert_manage").datagrid("options").queryParams=queryParams; 
			$("#expert_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#expertQueryForm").form({
			    url:"Expert/OutToExcel",
			});
			//提交表单
			$("#expertQueryForm").submit();
		},
		remove : function () {
			var rows = $("#expert_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var expertUserNames = [];
						for (var i = 0; i < rows.length; i ++) {
							expertUserNames.push(rows[i].expertUserName);
						}
						$.ajax({
							type : "POST",
							url : "Expert/deletes",
							data : {
								expertUserNames : expertUserNames.join(","),
							},
							beforeSend : function () {
								$("#expert_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#expert_manage").datagrid("loaded");
									$("#expert_manage").datagrid("load");
									$("#expert_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#expert_manage").datagrid("loaded");
									$("#expert_manage").datagrid("load");
									$("#expert_manage").datagrid("unselectAll");
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
			var rows = $("#expert_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Expert/" + rows[0].expertUserName +  "/update",
					type : "get",
					data : {
						//expertUserName : rows[0].expertUserName,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (expert, response, status) {
						$.messager.progress("close");
						if (expert) { 
							$("#expertEditDiv").dialog("open");
							$("#expert_expertUserName_edit").val(expert.expertUserName);
							$("#expert_expertUserName_edit").validatebox({
								required : true,
								missingMessage : "请输入专家账号",
								editable: false
							});
							$("#expert_password_edit").val(expert.password);
							$("#expert_password_edit").validatebox({
								required : true,
								missingMessage : "请输入登录密码",
							});
							$("#expert_name_edit").val(expert.name);
							$("#expert_name_edit").validatebox({
								required : true,
								missingMessage : "请输入姓名",
							});
							$("#expert_gender_edit").val(expert.gender);
							$("#expert_gender_edit").validatebox({
								required : true,
								missingMessage : "请输入性别",
							});
							$("#expert_birthDate_edit").datebox({
								value: expert.birthDate,
							    required: true,
							    showSeconds: true,
							});
							$("#expert_expertPhoto").val(expert.expertPhoto);
							$("#expert_expertPhotoImg").attr("src", expert.expertPhoto);
							$("#expert_school_edit").val(expert.school);
							$("#expert_school_edit").validatebox({
								required : true,
								missingMessage : "请输入毕业学校",
							});
							$("#expert_workExperience_edit").val(expert.workExperience);
							$("#expert_workExperience_edit").validatebox({
								required : true,
								missingMessage : "请输入工作经验",
							});
							$("#expert_telephone_edit").val(expert.telephone);
							$("#expert_telephone_edit").validatebox({
								required : true,
								missingMessage : "请输入联系电话",
							});
							expert_expertDesc_editor.setContent(expert.expertDesc, false);
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
