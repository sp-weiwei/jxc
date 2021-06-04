<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>库存报表</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/static/Highcharts-6.2.0/code/highcharts.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(function(){
            var chart=new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: 'container',
                    events:{
                        load:function(event){
                            // ajax请求后台数据
                            $.post("${pageContext.request.contextPath}/goods/inventoryReport.do",{},function(result){
                                var xArr=new Array();
                                var yArr=new Array();
                                for(var i=0;i<result.length;i++){
                                    xArr.push(result[i].name);
                                    yArr.push(result[i].inventory);
                                }
                                chart.xAxis[0].categories=xArr;
                                chart.series[0].setData(yArr);
                            },"json");
                        }
                    }
                },
                title:{
                    text: '库存报表'
                },
                xAxis:{
                    title:'商品',
                    categories: ['A',"B","C"]
                },
                yAxis:{
                    title: {
                        text: '库存数量'  //指定y轴的标题
                    }
                },
                series: [{name:'库存',data:[1,2,3]}]
            });
        });

    </script>
</head>
<body style="margin: 1px">

<div >
    <div id="container" style="height: 300px;"></div>
</div>

        <div  style="padding: 10px;border: 0px;height: 250px">
            <table id="dg" title="库存情况" class="easyui-datagrid" fitColumns="true" rownumbers="true"
                   url="${pageContext.request.contextPath}/goods/inventoryReport.do" fit="true" toolbar="#tb">
                <thead>
                <tr>
                    <th field="id" width="30" align="center">编号</th>
                    <th field="name" width="80" align="center">商品名称</th>
                    <th field="inventory" width="50" align="center">库存数量</th>

                </tr>
                </thead>
            </table>
        </div>

</body>
</html>