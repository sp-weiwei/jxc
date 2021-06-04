<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>按月统计分析</title>
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
                            $.post("${pageContext.request.contextPath}/order/saleMonth.do",{},function(result){
                                var xArr=new Array();
                                var yArr=new Array();
                                for(var i=0;i<result.length;i++){
                                    xArr.push(result[i].orderDate);
                                    yArr.push(result[i].lirun);
                                }
                                chart.xAxis[0].categories=xArr;
                                chart.series[0].setData(yArr);
                            },"json");
                        }
                    }
                },
                title:{
                    text: '按月统计分析'
                },
                xAxis:{
                    title:'日期',
                    categories: ['A']
                },
                yAxis:{
                    title: {
                        text: '利润'  //指定y轴的标题
                    }
                },
                series: [{name:'日期',data:[1]}]
            });
        });

        function formatXiaoshou(val,row) {
            return "￥"+val;
        }

        function formatChengben(val,row) {
            return "￥"+val;
        }

        function formatLirun(val,row) {
            return "￥"+val;
        }

    </script>
</head>
<body style="margin: 1px">

<div >
    <div id="container" style="height: 300px;"></div>
</div>

<div  style="padding: 10px;border: 0px;height: 250px">
    <table id="dg" title="近一个月的销售情况" class="easyui-datagrid" fitColumns="true" rownumbers="true"
           url="${pageContext.request.contextPath}/order/saleMonth.do" fit="true" toolbar="#tb">
        <thead>
        <tr>
            <th field="orderDate" width="30" align="center">编号</th>
            <th field="xiaoshou" width="80" align="right" formatter="formatXiaoshou">销售金额</th>
            <th field="chengben" width="50" align="right" formatter="formatChengben">成本金额</th>
            <th field="lirun" width="50" align="right" formatter="formatLirun">利润金额</th>
        </tr>
        </thead>
    </table>
</div>

</body>
</html>