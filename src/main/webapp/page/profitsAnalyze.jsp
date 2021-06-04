<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>销售利润综合分析</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/static/Highcharts-6.2.0/code/highcharts.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(function(){
            var chart1=new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: 'container1',
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
                                chart1.xAxis[0].categories=xArr;
                                chart1.series[0].setData(yArr);
                            },"json");
                        }
                    }
                },
                title:{
                    text: '利润分析'
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

            var chart2=new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: 'container2',
                    events:{
                        load:function(event){
                            // ajax请求后台数据
                            $.post("${pageContext.request.contextPath}/order/saleMonth.do",{},function(result){
                                var xArr=new Array();
                                var yArr=new Array();
                                for(var i=0;i<result.length;i++){
                                    xArr.push(result[i].orderDate);
                                    yArr.push(result[i].chengben);
                                }
                                chart2.xAxis[0].categories=xArr;
                                chart2.series[0].setData(yArr);
                            },"json");
                        }
                    }
                },
                title:{
                    text: '成本金额分析'
                },
                xAxis:{
                    title:'日期',
                    categories: ['A']
                },
                yAxis:{
                    title: {
                        text: '成本金额'  //指定y轴的标题
                    }
                },
                series: [{name:'日期',data:[1]}]
            });

            var chart3=new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: 'container3',
                    events:{
                        load:function(event){
                            // ajax请求后台数据
                            $.post("${pageContext.request.contextPath}/order/saleMonth.do",{},function(result){
                                var xArr=new Array();
                                var yArr=new Array();
                                for(var i=0;i<result.length;i++){
                                    xArr.push(result[i].orderDate);
                                    yArr.push(result[i].xiaoshou);
                                }
                                chart3.xAxis[0].categories=xArr;
                                chart3.series[0].setData(yArr);
                            },"json");
                        }
                    }
                },
                title:{
                    text: '销售金额分析'
                },
                xAxis:{
                    title:'日期',
                    categories: ['A']
                },
                yAxis:{
                    title: {
                        text: '销售金额'  //指定y轴的标题
                    }
                },
                series: [{name:'日期',data:[1]}]
            });

        });


    </script>
</head>
<body style="margin: 1px">

<div >
    <div id="container1" style="height: 300px;"></div>
    <div id="container2" style="height: 300px;"></div>
    <div id="container3" style="height: 300px;"></div>
</div>


</body>
</html>