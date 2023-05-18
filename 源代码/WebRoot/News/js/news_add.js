$(function () {
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	UE.delEditor('news_content');
	var news_content_editor = UE.getEditor('news_content'); //资讯内容编辑框
	$("#news_newsClassObj_newsClassId").combobox({
	    url:'NewsClass/listAll',
	    valueField: "newsClassId",
	    textField: "newsClassName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#news_newsClassObj_newsClassId").combobox("getData"); 
            if (data.length > 0) {
                $("#news_newsClassObj_newsClassId").combobox("select", data[0].newsClassId);
            }
        }
	});
	$("#news_title").validatebox({
		required : true, 
		missingMessage : '请输入资讯标题',
	});

	$("#news_petClassObj_petClassId").combobox({
	    url:'PetClass/listAll',
	    valueField: "petClassId",
	    textField: "petClassName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#news_petClassObj_petClassId").combobox("getData"); 
            if (data.length > 0) {
                $("#news_petClassObj_petClassId").combobox("select", data[0].petClassId);
            }
        }
	});
	$("#news_tixing").validatebox({
		required : true, 
		missingMessage : '请输入宠物体型',
	});

	$("#news_publishDate").datetimebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	//单击添加按钮
	$("#newsAddButton").click(function () {
		if(news_content_editor.getContent() == "") {
			alert("请输入资讯内容");
			return;
		}
		//验证表单 
		if(!$("#newsAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#newsAddForm").form({
			    url:"News/add",
			    onSubmit: function(){
					if($("#newsAddForm").form("validate"))  { 
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
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#newsAddForm").form("clear");
                        news_content_editor.setContent("");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#newsAddForm").submit();
		}
	});

	//单击清空按钮
	$("#newsClearButton").click(function () { 
		$("#newsAddForm").form("clear"); 
	});
});
