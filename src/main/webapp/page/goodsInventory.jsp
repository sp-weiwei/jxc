<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品盘点</title>

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
				<th field="unit" width="30" align="center">单位</th>
                <th field="type" width="80" align="center">类型</th>
				<th field="address" width="60" align="center">商品产地</th>
				<th field="inPrice" width="60" align="center">进价(元)</th>
                <th field="outPrice" width="60" align="center">售价(元)</th>
                <th field="stockDate" width="80" align="center">进货日期</th>
                <th field="inventory" width="60" align="center">库存</th>
                <th field="supplier" width="100" align="center" formatter="formatSupplier">供应商名称</th>
                <th field="remark" width="200" align="center">备注</th>
			</tr>
		</thead>
	</table>

    <div id="tb">
        <div style="margin: 5px">
            &nbsp;&nbsp;商品名称：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
            &nbsp;&nbsp;单位：&nbsp;<input type="text" id="s_unit" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
            &nbsp;&nbsp;商品类型：&nbsp;<input type="text" id="s_type" size="20" onkeydown="if(event.keyCode==13) searchGoods()"/>
            <a href="javascript:searchGoods()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
        </div>
    </div>
	
</body>
</html>