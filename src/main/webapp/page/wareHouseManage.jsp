<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
	
	<script type="text/javascript">

        var url;

        function addWareHouse(){
            $("#dlg").dialog("open").dialog("setTitle","添加仓库信息");
            url="${pageContext.request.contextPath}/wareHouse/save.do";
        }

        function goodsModify(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length!=1){
                $.messager.alert("系统提示","请选择一条要编辑的数据！");
                return;
            }
            var row=selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle","编辑仓库信息");
            $("#fm").form("load",row);
            url="${pageContext.request.contextPath}/wareHouse/save.do?id="+row.id;
        }

        function saveWareHouse(){
            $("#fm").form("submit",{
                url:url,
                onSubmit:function(){
                    if($("#state").combobox("getValue")==""){
                        $.messager.alert("系统提示","请选择状态！");
                        return false;
                    }
                    return $(this).form("validate");
                },
                success:function(result){
                    var result=eval('('+result+')');
                    if(result.success){
                        $.messager.alert("系统提示","保存成功!");
                        resetValue();
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    }else{
                        $.messager.alert("系统提示","保存失败！");
                        return;
                    }
                }
            });
        }

        function resetValue(){
            $("#name").val("");
            $("#num").val("");
            $("#state").combobox("setValue","");
        }

        function closeWareHouseDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function deleteWareHouse(){
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
                    $.post("${pageContext.request.contextPath}/wareHouse/delete.do",{ids:ids},function(result){
                        //alert(result.success);
                        if(result.success){
                            if(result.exist){
                                $.messager.alert("系统提示",result.exist);
                            }else{
                                $.messager.alert("系统提示","数据已成功删除！");
                            }
                            $("#dg").datagrid("reload");
                        }else{
                            $.messager.alert("系统提示","数据删除失败！");
                        }
                    },"json");
                }
            });
        }

        //格式化供应商
        function formatState(val,row) {
           if(row.state==0){
               return "关闭";
           }else if(row.state==1){
               return "开放";
           }else if(row.state==2){
               return "维修";
           }else{
               return val;
           }
        }

	</script>
</head>
<body style="margin: 1px">
	<table id="dg" title="仓库管理" class="easyui-datagrid"
	fitColumns="true" rownumbers="true"
	url="${pageContext.request.contextPath}/wareHouse/list.do" fit="true" toolbar="#tb">
        <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="30" align="center">编号</th>
				<th field="name" width="80" align="center">仓库名称</th>
                <th field="num" width="100" align="center">可存货数量</th>
                <th field="state" width="100" align="center" formatter="formatState">仓库状态</th>
			</tr>
		</thead>
	</table>

    <div id="tb">
        <div>
            <a href="javascript:addWareHouse()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:goodsModify()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
            <a href="javascript:deleteWareHouse()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
    </div>

    <div id="dlg" class="easyui-dialog" style="width: 300px;height: 200px;padding: 10px" closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post">
            <table style="margin: 5px" cellspacing="5px">
                <tr>
                    <td>仓库名称：</td>
                    <td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                </tr>
                <tr>
                    <td>可存数量：</td>
                    <td><input type="text" id="num" name="num" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                </tr>
                <tr>
                    <td>状态：</td>
                    <td>
                        <select class="easyui-combobox" style="width: 160px" id="state" name="state" editable="false" panelHeight="auto" required="true">
                            <option value="">请选择...</option>
                            <option value="0">关闭</option>
                            <option value="1">开放</option>
                            <option value="2">维修</option>
                        </select>
                    </td>
                </tr>

            </table>
        </form>

        <div id="dlg-buttons">
            <a href="javascript:saveWareHouse()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
            <a href="javascript:closeWareHouseDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
        </div>
    </div>
	
</body>
</html>