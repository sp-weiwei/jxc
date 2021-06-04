<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
	
	<script type="text/javascript">

        var url;
        function searchLog(){
            $("#dg").datagrid('load',{
                "name":$("#s_name").val(),
            });
        }


        function deleteLog(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length==0){
                $.messager.alert("系统提示","请选择要删除的数据！");
                return;
            }
            var strIds=[];
            for(var i=0;i<selectedRows.length;i++){
                strIds.push(selectedRows[i].id);
            }
            var ids=strIds.join(",");
            $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
                if(r){
                    $.post("${pageContext.request.contextPath}/log/delete.do",{ids:ids},function(result){
                        //alert(result.success);
                        if(result.success){
                            $.messager.alert("系统提示","数据已成功删除！");
                            $("#dg").datagrid("reload");
                        }else{
                            $.messager.alert("系统提示","数据删除失败！");
                        }
                    },"json");
                }
            });
        }

	</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="日志管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/log/list.do" fit="true" toolbar="#tb">
        <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="80" align="center">编号</th>
                <th field="name" width="100" align="center">操作人</th>
                <th field="logname" width="100" align="center">操作内容</th>
				<th field="time" width="100" align="center">操作时间</th>
				<th field="ipaddr" width="100" align="center">IP地址</th>
			</tr>
		</thead>
	</table>

    <div id="tb">
        <div>
            <a href="javascript:deleteLog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            操作人：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchLog()"/>
            <a href="javascript:searchLog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
        </div>
    </div>


	
</body>
</html>