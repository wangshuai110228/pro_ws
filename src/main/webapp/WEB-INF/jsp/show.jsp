<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入easyui样式文件 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/default/easyui.css">
<!-- 引入easyui图标样式文件 -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/icon.css">
<!-- 引入jquery js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
<!-- 引入easyui的js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<!-- 引文easyui支持中文js -->
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入uploadify css js文件 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/uploadify/uploadify.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/uploadify/jquery.uploadify.min.js"></script>
<!-- 引入kindeditor css js文件 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor-4.1.10/themes/default/default.css" />
<script src="<%=request.getContextPath() %>/js/kindeditor-4.1.10/kindeditor-all.js"></script>
</head>
<body>
<!-- 条件查询+按钮 -->
<div id="searchDiv">

姓名：<input class="easyui-textbox" id="user_name">

<a href="javascript:search()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a><br>

<a href="javascript:openDig()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
<a href="javascript:deleteBys()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>

</div>
<!-- 定义表格 -->
	<table id="myTable">
	</table> 
	<!-- 定义新增表格 -->
		<div id="myDialog" class="easyui-dialog" style="width:500px;height:400px" data-options="modal:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
	<form id="myForm" method="post">
	<input style="display:none" name="id">
	 <table>
  <tr>
	<td>头像</td>
	<td>
		<!-- 显示图片 -->
		<img width="100px" height="100px"  id="mypic">
		<!-- 文件域 上传图片 -->
		<div id="eimg"></div>
		<!-- 隐藏域 上传图片的路径 -->
		<input type="hidden" name="userimg"  id="create_user">

		<%--显示进度条--%>
		<div id="uploadfileQueue"></div>
	</td>
  </tr>

  <tr>
	<td>姓名</td>
	<td>
	<input class="easyui-textbox" name="name">
	</td>
		 <tr>
			 <td>年龄</td>
			 <td>
				 <input class="easyui-textbox" name="age">
			 </td>
		 <tr>
			 <td>性别</td>
			 <td>
				 <input type="radio" value="1" name="sex">男
				 <input type="radio" value="0" name="sex">女
			 </td>
		 </tr>
		 <tr>
			 <td>手机号码</td>
			 <td>
				 <input class="easyui-textbox" name="phone">
			 </td>
		 </tr>
		 <tr>
			 <td>部门</td>
			 <td>
				 <input class="easyui-combobox" name="deptid" id="Deptid">
			 </td>
		 </tr>
		 </tr>
	<tr>
			<td>角色</td>
			<td>
				<input class="easyui-combobox" name="roleid" id="roleId">
			</td>
		  </tr>
  </tr>
		 <tr>
			 <td>账号</td>
			 <td>
				 <input class="easyui-textbox" name="username">
			 </td>
		 </tr>
  <tr>
	<td>密码</td>
	<td>
	<input class="easyui-textbox" name="userpwd">
	</td>
  </tr>

  </table>
	
	</form>
		
		</div>	
	
<!-- 定义按钮 -->
<div id="myButton">
<a href="javascript:add()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
<a href="javascript:closeDig()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>


</body>
<script type="text/javascript">
//查询角色
function initRole(){
	$("#roleId").combobox({
		url:"<%=request.getContextPath() %>/queryUserRole",
		valueField:"id",
		textField:"rname",
		multiple:true
	})
	
	
}

//查询部门
function initDeptid(){
	$("#Deptid").combobox({
		url:"<%=request.getContextPath() %>/queryUserDeptid",
		valueField:"id",
		textField:"dname",
		multiple:true
	})


}


//查询
$("#myTable").datagrid({
	url:"<%=request.getContextPath()%>/queryUserBean",
	columns:[[
	          {field:'check',checkbox:true},
        {field:'id',title:'编号'},
        {field:'userimg',title:'封面',formatter:function(value,row,index){
            return "<img width='50px' height='50px' src='"+value+"'>";
        }},
        {field:'name',title:'姓名'},
		{field:'age',title:'年龄'},
        {field:'sex',title:'性别',formatter:function(value,row,index){
            if(value==1){
                return "男";
            }else{
                return "女";
            }
        }},
		{field:'phone',title:'手机号码'},
        {field:'dname',title:'部门'},
        {field:"rname",title:"角色"},
        {field:'username',title:'账号'},
        {field:'userpwd',title:'密码'},

		{field:'registration_date',title:'开号时间'},
        {field:'tools',title:'操作', width:100,align:'center',formatter:function(value,row,index){
            var str = "<a href='javascript:openUpdateBy("+row.id+")'>修改</a>"
            str+="| <a href='javascript:deleteByid("+row.id+")'>删除</a>"
            return str;
        }}
	          
	          ]],
pagination:true,//开启分页
	 pageList:[1,2,3,4,5,6], //初始化页面大小选择列表
	 pageSize:3 , //初始化每页显示条数，默认是10
	 pageNumber:1, //当前页,默认是1
	 fit:true,
	 toolbar:"#searchDiv",
	 pagePosition:"top"
})

//批量删除
function deleteBys(){
	
	//获取复选框
	var arr = $("#myTable").datagrid("getChecked");
	if(arr.length<=0){
		$.messager.alert("提示消息","请至少选择一条数据！","warning");
		return;
	}
	$.messager.confirm("提示","是否确认删除"+arr.length+"条数据？",function(r){
		if(r){
			var ids = "";
			for(var i=0;i<arr.length;i++){
				//alert(arr[i].id);
				if(ids==""){
					ids += arr[i].id;
				}else{
					ids += ","+arr[i].id;
				}
			}
			
		}
		
		//alert(ids)
		$.ajax({
			url:"<%=request.getContextPath() %>/deleteUserAll",
			type:"post",
			data:{"id":ids},
			success:function(){
				$.messager.alert("提示消息","删除成功","info");
				search();
			},error:function(){
				$.messager.alert("提示消息","删除失败","error");

				
			}
		})
		
	})
}

	//单个删除
	function deleteByid(id){
		
		//alert(id)
		$.messager.confirm("提示","是否确定删除!",function(r){
			if(r){
				$.ajax({
					url:"<%=request.getContextPath() %>/deleteUserAll",
					type:"post",
					data:{"id":id},
					success:function(){
						$.messager.alert("提示消息","删除成功","info");
						search();
					},error:function(){
						$.messager.alert("提示消息","删除失败","error");

						
					}
				})
				
			}
			
		})
	}

	//修改：回显
	function openUpdateBy(id){
		//alert(id)
		$.ajax({
			url:"<%=request.getContextPath() %>/queryUserById",
			type:"post",
			data:{"id":id},
			success:function(data){

				//数据回显
				$("#myForm").form("load",data);


                initDeptid();

                initRole();

				//回显：图片
				$("#mypic").prop("src",data.userimg)
				// 文本框 回填
				//$('#hideImg').val(imgurl);


				//弹框
				$("#myDialog").dialog({
					title:"修改用户",
					closed:false
				})
			}
		})
	}

	//条件查询
	function search(){
		$("#myTable").datagrid("load",{
		user_name:$("#user_name").textbox("getValue"),

		})
		
	}

	//打开对话框
	function openDig(){
		//重置表单
		$("#myForm").form("reset");
		//清除图片隐藏域
		$("#hideImg").val("");
		//清除图片
		$("#mypic").prop("src","");
		//清空富文本框
		//editor.html("");
		initDeptid();

		initRole()
		//打开
		$("#myDialog").dialog({
			title:'新增用户',
			closed:false
			
		})
		
	}
	//关闭对话框
	function closeDig(){
		$("#myDialog").dialog("close")
		
	}
	
	//新增
	function add(){
		$("#myForm").form("submit",{
			url:"<%=request.getContextPath() %>/addUser",
			success:function(){
				$.messager.alert("提示","保存成功","info")
				//关闭弹框
				$("#myDialog").dialog("close")
				//关闭
				closeDig()
				//刷新
				search()
			}
			
		})
		
	}

////初始化uploadify

	$("#eimg").uploadify({
		//开启调试
		'debug': false,
		//是否自动上传
		'auto': true,
		'multi': false,  //是否多文件上传
		//'buttonImage':'<%=request.getContextPath()%>/js/uploadify/background.png', //浏览将要上传文件按钮的背景图片路径
		'buttonText': '选择文件',
		//flash
		'swf': "<%=request.getContextPath()%>/js/uploadify/uploadify.swf",
		'fileObjName': "picFile",
		'queueSizeLimit': 5,
		//文件选择后的容器ID
		'queueID': 'uploadfileQueue',
		//后台运行上传的程序
		'uploader': '<%=request.getContextPath()%>/uploadImg',
		'width': '100',
		'height': '24',
		//是否支持多文件上传，这里为true，你在选择文件的时候，就可以选择多个文件
		'multi': true,
		'fileTypeDesc': '支持的格式：',
		'fileTypeExts': '*.jpg;*.jpge;*.gif;*.png',
		'fileSizeLimit': '1MB',
		//上传完成后多久删除进度条
		'removeTimeout': 1,
		//返回一个错误，选择文件的时候触发
		'onSelectError': function (file, errorCode, errorMsg) {
			switch (errorCode) {
				case -100:
					alert("上传的文件数量已经超出系统限制的" + $('#file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！");
					break;
				case -110:
					alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
					break;
				case -120:
					alert("文件 [" + file.name + "] 大小异常！");
					break;
				case -130:
					alert("文件 [" + file.name + "] 类型不正确！");
					break;
			}
		},
		//检测FLASH失败调用
		'onFallback': function () {
			alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
		},
		//上传到服务器，服务器返回相应信息到data里
		'onUploadSuccess': function (file, data, response) {
			//alert(data);
			$("#mypic").attr("src", "<%=request.getContextPath()%>/"+data);
			$("#create_user").val(data);
		},
		//多文件上传，服务器返回相应的信息
		'onQueueComplete': function (queueData) {
			//alert(queueData.uploadsSuccessful);
		}
	});

</script>
</html>