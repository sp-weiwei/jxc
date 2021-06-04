<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商信息管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

	
	<script type="text/javascript">

        var url;
        function searchSupplier(){
            $("#dg").datagrid('load',{
                "principal":$("#s_principal").val(),
                "name":$("#s_name").val(),
                "xyd":$("#s_xyd").combobox("getValue"),
            });
        }

        function addSupplier(){
            $("#dlg").dialog("open").dialog("setTitle","添加供应商信息");
            url="${pageContext.request.contextPath}/supplier/save.do";
        }

        function supplierModify(){
            var selectedRows=$("#dg").datagrid("getSelections");
            if(selectedRows.length!=1){
                $.messager.alert("系统提示","请选择一条要编辑的数据！");
                return;
            }
            var row=selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle","编辑供应商信息");
            $("#fm").form("load",row);
            url="${pageContext.request.contextPath}/supplier/save.do?id="+row.id;
        }

        function saveSupplier(){
            $("#fm").form("submit",{
                url:url,
                onSubmit:function(){

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
            $("#principal").val("");
            $("#area").val("");
            $("#xyd").combobox("setValue","");
            $("#address").val("");
            $("#phone").val("");
            $("#email").val("");
            $("#remark").val("");
        }

        function closeSupplierDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function deleteSupplier(){
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
                    $.post("${pageContext.request.contextPath}/supplier/delete.do",{ids:ids},function(result){
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
	<table id="dg" title="供应商管理" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/supplier/list.do" fit="true" toolbar="#tb">
        <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="30" align="center">编号</th>
				<th field="supplierNo" width="100" align="center">供应商编号</th>
				<th field="name" width="100" align="center">供应商名称</th>
                <th field="principal" width="50" align="center">负责人</th>
				<th field="area" width="50" align="center">所在地区</th>
				<th field="xyd" width="50" align="center">信誉度</th>
                <th field="address" width="150" align="center">地址</th>
                <th field="phone" width="80" align="center">电话</th>
                <th field="email" width="120" align="center">邮箱</th>
                <th field="remark" width="200" align="center">备注</th>
			</tr>
		</thead>
	</table>

    <div id="tb">
        <div>
            <a href="javascript:addSupplier()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:supplierModify()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
            <a href="javascript:deleteSupplier()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>
        <div>
            &nbsp;&nbsp;供应商负责人：&nbsp;<input type="text" id="s_principal" size="20" onkeydown="if(event.keyCode==13) searchSupplier()"/>
            &nbsp;&nbsp;供应商名称：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchSupplier()"/>
            &nbsp;&nbsp;供应商信誉度：&nbsp;<select class="easyui-combobox" style="width: 80px" id="s_xyd" panelHeight="auto" editable="false">
                <option value="">请选择...</option>
                <option value="☆">☆</option>
                <option value="☆☆">☆☆</option>
                <option value="☆☆☆">☆☆☆</option>
                <option value="☆☆☆☆">☆☆☆☆</option>
                <option value="☆☆☆☆☆">☆☆☆☆☆</option>
            </select>
            <a href="javascript:searchSupplier()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
        </div>
    </div>

    <div id="dlg" class="easyui-dialog" style="width: 600px;height: 250px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post">
            <table style="margin: 5px" cellspacing="8px">
                <tr>
                    <td>供应商名字：</td>
                    <td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>

                    <td>负责人：</td>
                    <td><input type="text" id="principal" name="principal" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                </tr>
                <tr>
                    <td>所在地区：</td>
                    <td><input type="text" id="area" name="area" class="easyui-validatebox"/></td>

                    <td>信誉度：</td>
                    <td>
                        <select class="easyui-combobox" style="width: 154px" id="xyd" name="xyd" editable="false" panelHeight="auto" >
                            <option value="">请选择...</option>
                            <option value="☆">☆</option>
                            <option value="☆☆">☆☆</option>
                            <option value="☆☆☆">☆☆☆</option>
                            <option value="☆☆☆☆">☆☆☆☆</option>
                            <option value="☆☆☆☆☆">☆☆☆☆☆</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>地   址：</td>
                    <td><input type="text" id="address" name="address" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>

                    <td>电   话：</td>
                    <td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                </tr>
                <tr>
                    <td>邮   箱：</td>
                    <td><input type="text" id="email" name="email" class="easyui-validatebox"  validType="email" required="true"/>&nbsp;<font color="red">*</font></td>

                    <td>备   注：</td>
                    <td><input type="text" id="remark" name="remark" class="easyui-validatebox"/></td>
                </tr>
            </table>
        </form>

        <div id="dlg-buttons">
            <a href="javascript:saveSupplier()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
            <a href="javascript:closeSupplierDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
        </div>
    </div>
	
</body>
</html>