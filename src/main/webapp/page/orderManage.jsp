<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
	
	<script type="text/javascript">

        $(function(){

            $.post("${pageContext.request.contextPath}/customer/findById.do",{id:${param.customerId}},function(result){
                $("#customerNo").val(result.customerNo);
                $("#name").val(result.name);
            },"json");
        });

        function formatGoods(val,row) {
            return val.name;
        }

	</script>
</head>
<body style="margin: 10px">

    <div id="p" class="easyui-panel" title="客户基本信息" style="height: 100px;padding: 10px">
        <table cellspacing="8px">
            <tr>
                <td>客户编号：</td>
                <td><input type="text" id="customerNo" name="customerNo" readonly="readonly"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>客户名称</td>
                <td><input type="text" id="name" name="name" readonly="readonly"/></td>
            </tr>
        </table>
    </div>

    </br>

	<table id="dg" title="客户历史订单" class="easyui-datagrid"
	fitColumns="true" pagination="true" rownumbers="true"
	url="${pageContext.request.contextPath}/order/list.do?customerId=${param.customerId}" style="height: 400px" toolbar="#tb">
        <thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="30" align="center">编号</th>
                <th field="orderNo" width="80" align="center">订单编号</th>
				<th field="goods" width="80" align="center" formatter="formatGoods">商品名称</th>
				<th field="goodsNum" width="50" align="center">商品数量</th>
                <th field="unit" width="50" align="center">单位</th>
				<th field="price" width="50" align="center">订价(元)</th>
				<th field="sum" width="50" align="center">总价(元)</th>
                <th field="orderDate" width="70" align="center">订购日期</th>
                <th field="address" width="200" align="center">发货地址</th>
                <th field="remark" width="200" align="center">备注</th>
			</tr>
		</thead>
	</table>

</body>
</html>