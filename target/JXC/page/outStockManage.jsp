<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>销售管理</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>

    <script type="text/javascript">

        var url;

        function addOrder(){
            $("#dlg").dialog("open").dialog("setTitle","添加客户订单信息");
            url="${pageContext.request.contextPath}/order/save.do";
        }

        function saveOrder(){
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
            $("#customerId").combobox("setValue","");
            $("#goodsId").combobox("setValue","");
            $("#goodsNum").val("");
            $("#unit").val("");
            $("#price").val("");
            $("#orderDate").datebox("setValue","");
            $("#address").val("");
            $("#remark").val("");
        }

        function closeOrderDialog(){
            $("#dlg").dialog("close");
            resetValue();
        }

        function deleteOrder(){
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
                    $.post("${pageContext.request.contextPath}/order/delete.do",{ids:ids},function(result){
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

        function formatCustomer(val,row) {
            if(row.customer.name){
                return val.name;
            }
            return val;
        }

        function formatOrder(val,row) {
            return val.name;
        }

    </script>
</head>
<body style="margin: 1px">

<table id="dg" title="客户历史订单" class="easyui-datagrid"
       fitColumns="true" pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/order/list.do" fit="true" toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="30" align="center">编号</th>
        <th field="orderNo" width="80" align="center">订单编号</th>
        <th field="customer" width="100" align="center" formatter="formatCustomer">订单客户</th>
        <th field="goods" width="80" align="center" formatter="formatOrder">商品名称</th>
        <th field="goodsNum" width="50" align="center">订购数量</th>
        <th field="unit" width="50" align="center">单位</th>
        <th field="price" width="50" align="center">订价(元)</th>
        <th field="sum" width="50" align="center">总价(元)</th>
        <th field="orderDate" width="70" align="center">订购日期</th>
        <th field="address" width="200" align="center">发货地址</th>
        <th field="remark" width="200" align="center">备注</th>
    </tr>
    </thead>
</table>


<div id="tb">
    <div>
        <a href="javascript:addOrder()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加客户订单</a>
        <a href="javascript:deleteOrder()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 750px;height: 300px;padding: 10px" closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table style="margin: 5px" cellpadding="8px">
            <tr>
                <td>订单客户：</td>
                <td><input class="easyui-combobox" id="customerId" name="customer.id" required="true" editable="false" data-options="panelHeight:'150',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/customer/findAll.do'"/>&nbsp;<font color="red">*</font></td>
                <td>商品名称：</td>
                <td><input class="easyui-combobox" id="goodsId" name="goods.id" required="true" editable="false" data-options="panelHeight:'150',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/goods/findAll.do'"/>&nbsp;<font color="red">*</font></td>
            </tr>
            <tr>
                <td>订购数量：</td>
                <td><input type="text" id="goodsNum" name="goodsNum" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                <td>单位：</td>
                <td><input type="text" id="unit" name="unit" class="easyui-validatebox"/></td>
            </tr>
            <tr>
                <td>订价(元)：</td>
                <td><input type="text" id="price" name="price" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
                <td>订购日期：</td>
                <td><input type="text" id="orderDate" name="orderDate" class="easyui-datebox" required="true"/>&nbsp;<font color="red">*</font></td>
            </tr>
            <tr>
                <td>发货地址：</td>
                <td><input type= "text" id="address" name="address"  class= "easyui-validatebox" required ="true">&nbsp;<font color="red">*</font></td>
                <td>备注：</td>
                <td><input type= "text" id="remark" name="remark"  class= "easyui-validatebox"></td>
            </tr>
        </table>
    </form>

    <div id="dlg-buttons">
        <a href="javascript:saveOrder()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
        <a href="javascript:closeOrderDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>
</div>

</body>
</html>