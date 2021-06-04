<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>进货管理</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>

    <script type="text/javascript">

        var url;
        function searchGoods(){
            $("#dg").datagrid('load',{
                "name":$("#s_name").val(),
                "unit":$("#s_unit").val(),
                "type":$("#s_type").val(),
            });
        }

        function addGoods(){
            $("#dlg").dialog("open").dialog("setTitle","添加进货信息");
            url="${pageContext.request.contextPath}/goods/save.do";
        }

        function saveGoods(){
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
            $("#unit").val("");
            $("#type").val("");
            $("#address").val("");
            $("#inPrice").val("");
            $("#outPrice").val("");
            $("#stockDate").datebox("setValue","");
            $("#inventory").val("");
            $("#supplierId").combobox("setValue","");
            $("#remark").val("");
        }

        function closeGoodsDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function deleteGoods(){
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
                    $.post("${pageContext.request.contextPath}/goods/delete.do",{ids:ids},function(result){
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
        function formatSupplier(val,row) {
            return val.name;
        }

    </script>
</head>
<body style="margin: 1px">
<table id="dg" title="商品管理" class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/goods/list.do" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="30" align="center">编号</th>
        <th field="goodsNo" width="100" align="center">商品编号</th>
        <th field="name" width="80" align="center">商品名称</th>
        <th field="unit" width="50" align="center">单位</th>
        <th field="type" width="80" align="center">类型</th>
        <th field="address" width="80" align="center">商品产地</th>
        <th field="inPrice" width="80" align="center">进价(元)</th>
        <th field="outPrice" width="80" align="center" hidden="true">售价(元)</th>
        <th field="stockDate" width="80" align="center">进货日期</th>
        <th field="inventory" width="80" align="center" hidden="true">库存</th>
        <th field="supplier" width="100" align="center" formatter="formatSupplier">供应商名称</th>
        <th field="remark" width="200" align="center" hidden="true">备注</th>
    </tr>
    </thead>
</table>

<div id="tb">
    <div>
        <a href="javascript:addGoods()" class="easyui-linkbutton" iconCls="icon-add" plain="true">进货入库</a>
        <a href="javascript:deleteGoods()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;&nbsp;商品名称：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
        &nbsp;&nbsp;单位：&nbsp;<input type="text" id="s_unit" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
        &nbsp;&nbsp;商品类型：&nbsp;<input type="text" id="s_type" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
        <a href="javascript:searchGoods()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 750px;height: 350px;padding: 10px" closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table style="margin: 5px" cellpadding="8px">
            <tr>
                <td>商品名字：</td>
                <td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>

                <td>单位：</td>
                <td><input type="text" id="unit" name="unit" class="easyui-validatebox"/></td>
            </tr>
            <tr>
                <td>商品类型：</td>
                <td><input type="text" id="type" name="type" class="easyui-validatebox"/></td>

                <td>商品产地：</td>
                <td><input type="text" id="address" name="address" class="easyui-validatebox"/></td>
            </tr>
            <tr>
                <td>进价：</td>
                <td><input type="text" id="inPrice" name="inPrice" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>

                <td>售价：</td>
                <td><input type="text" id="outPrice" name="outPrice" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
            </tr>
            <tr>
                <td>进货日期：</td>
                <td><input type= "text" id="stockDate" name="stockDate"  class= "easyui-datebox" editable="false" required ="required"> </input>
                </td>

                <td>进货数量：</td>
                <td><input type="text" id="inventory" name="inventory" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
            </tr>
            <tr>
                <td>供应商名称：</td>
                <td><input class="easyui-combobox" id="supplierId" name="supplier.id" data-options="panelHeight:'80',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/supplier/findAll.do'"/></td>
                <td>备   注：</td>
                <td><input type="text" id="remark" name="remark" class="easyui-validatebox"/></td>
            </tr>
        </table>
    </form>

    <div id="dlg-buttons">
        <a href="javascript:saveGoods()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
        <a href="javascript:closeGoodsDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>
</div>

</body>
</html>