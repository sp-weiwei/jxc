<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业销售管理系统后台主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

	function openTab(text,url,icon){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:icon,
				content:content,
				closable:true,
			});
		}
	}

	var url;

    function openPasswordModifyDialog(){
        $("#dlg").dialog("open").dialog("setTitle","修改密码");
        url="${pageContext.request.contextPath}/user/modifyPassword.do?id=${currentUser.id}";
    }

    function closePasswordModifyDialog(){
        $("#dlg").dialog("close");
        $("#oldPassword").val("");
        $("#newPassword").val("");
        $("#newPassword2").val("");
    }

    function modifyPassword(){
        $("#fm").form("submit",{
            url:url,
            onSubmit:function(){
                var oldPassword=$("#oldPassword").val();
                var newPassword=$("#newPassword").val();
                var newPassword2=$("#newPassword2").val();

                if(!$(this).form("validate")){
                    return false;
                }
                if(oldPassword!='${currentUser.password}'){
                    $.messager.alert("系统提示","原密码错误！","warning");
                    return false;
                }
                if(newPassword!=newPassword2){
                    $.messager.alert("系统提示","新密码两次不一样！","warning");
                    return false;
                }
                return true;
            },
            success:function(result){
                var result=eval('('+result+')');
                if(result.success){
                    $.messager.alert("系统提示","密码修改成功，下次登录生效!");
                    closePasswordModifyDialog();
                    $("#dlg").dialog("close");
                }else{
                    $.messager.alert("系统提示","密码修改失败！");
                    return;
                }
            }
        });
    }

	
	function systemHelp() {
        $("#dlg-info").dialog("open").dialog("setTitle","系统帮助")
    }

    function closeHelpSystem() {
        $("#dlg-info").dialog("close");
    }


    function logout(){
        $.messager.confirm("系统提示","您确定要退出系统吗",function(r){
            if(r){
                window.location.href="${pageContext.request.contextPath}/user/logout.do";
            }
        });
    }
	

</script>
</head>

<body class="easyui-layout">

	<!-- 北 -->
	<div region="north" style="height:80px; background-color: #E0ECFF" >
		<table style="padding:5px" width="100%">
			<tr>
				<td width="50%" style="padding-left: 100px">
                    <h1 style="font-family: 方正姚体">企业销售管理系统</h1>
				</td>
				<td valign="bottom" align="center" width="50%">
                    <font size="3" color="red"><strong>欢迎:</strong>${currentUser.userName } </font>
                    <c:if test="${currentUser.roleId==1}">【管理员】</c:if>
                    <c:if test="${currentUser.roleId==2}">【经理】</c:if>
                    <c:if test="${currentUser.roleId==3}">【采购主管】</c:if>
                    <c:if test="${currentUser.roleId==4}">【销售主管】</c:if>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 中 -->
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 150px">
					<font size="10" color="red">欢迎使用</font>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 西 -->
	<div region="west" style="width: 250px" title="导航菜单" split="true">
        <c:if test="${currentUser.roleId==1}">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="数据管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="javascript:openTab('供应商信息管理','supplierManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">供应商信息管理</a>
                    <a href="javascript:openTab('商品信息管理','goodsManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">商品信息管理</a>
                    <a href="javascript:openTab('客户信息管理','customerManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">客户信息管理</a>
                    <a href="javascript:openTab('仓库信息管理','wareHouseManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">仓库信息管理</a>
                </div>
                <div title="商品操作管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="javascript:openTab('商品进货管理','inStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品进货管理</a>
                    <a href="javascript:openTab('商品销售管理','outStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品销售管理</a>
                    <a href="javascript:openTab('商品盘点','goodsInventory.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品盘点</a>
                </div>
                <div title="综合管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="javascript:openTab('销售利润综合分析','profitsAnalyze.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">销售利润综合分析</a>
                    <a href="javascript:openTab('库存报表','inventoryReport.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">库存报表</a>
                    <a href="javascript:openTab('按月统计分析','saleMonth.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">按月统计分析</a>
                </div>

                <div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="javascript:openTab('用户管理','userManage.jsp','icon-link')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-link'" style="width: 150px">用户管理</a>
                    <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
                    <a href="javascript:systemHelp()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'" style="width: 150px;">系统帮助</a>
                    <a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
                </div>
            </div>
        </c:if>
        <c:if test="${currentUser.roleId==2}">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="数据管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="javascript:openTab('供应商信息管理','supplierManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">供应商信息管理</a>
                    <a href="javascript:openTab('商品信息管理','goodsManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">商品信息管理</a>
                    <a href="javascript:openTab('客户信息管理','customerManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">客户信息管理</a>
                </div>
                <div title="商品操作管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="javascript:openTab('商品进货管理','inStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品进货管理</a>
                    <a href="javascript:openTab('商品销售管理','outStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品销售管理</a>
                    <a href="javascript:openTab('商品盘点','goodsInventory.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品盘点</a>
                </div>
                <div title="综合管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="javascript:openTab('销售利润综合分析','profitsAnalyze.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">销售利润综合分析</a>
                    <a href="javascript:openTab('库存报表','inventoryReport.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">库存报表</a>
                    <a href="javascript:openTab('按月统计分析','saleMonth.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">按月统计分析</a>
                </div>

                <div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
                    <a href="javascript:systemHelp()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'" style="width: 150px;">系统帮助</a>
                    <a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
                </div>
            </div>
        </c:if>
        <c:if test="${currentUser.roleId==3}">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="数据管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="javascript:openTab('供应商信息管理','supplierManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">供应商信息管理</a>
                    <a href="javascript:openTab('商品信息管理','goodsManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">商品信息管理</a>
                </div>
                <div title="商品操作管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="javascript:openTab('商品进货管理','inStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品进货管理</a>
                    <a href="javascript:openTab('商品盘点','goodsInventory.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品盘点</a>
                </div>
                <div title="综合管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="javascript:openTab('库存报表','inventoryReport.jsp','icon-plgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-plgl'" style="width: 150px;">库存报表</a>
                </div>

                <div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
                    <a href="javascript:systemHelp()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'" style="width: 150px;">系统帮助</a>
                    <a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
                </div>
            </div>
        </c:if>
        <c:if test="${currentUser.roleId==4}">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="数据管理"  data-options="iconCls:'icon-bkgl'" style="padding:10px;">
                    <a href="javascript:openTab('供应商信息管理','supplierManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">供应商信息管理</a>
                    <a href="javascript:openTab('商品信息管理','goodsManage.jsp','icon-bkgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bkgl'" style="width: 150px;">商品信息管理</a>
                    <a href="javascript:openTab('客户信息管理','customerManage.jsp','icon-writeblog')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-writeblog'" style="width: 150px;">客户信息管理</a>
                </div>
                <div title="商品操作管理" data-options="iconCls:'icon-bklb'" style="padding:10px">
                    <a href="javascript:openTab('商品销售管理','outStockManage.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品销售管理</a>
                    <a href="javascript:openTab('商品盘点','goodsInventory.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">商品盘点</a>
                </div>
                <div title="综合管理"  data-options="iconCls:'icon-plgl'" style="padding:10px">
                    <a href="javascript:openTab('销售利润综合分析','profitsAnalyze.jsp','icon-review')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-review'" style="width: 150px">销售利润综合分析</a>
                    <a href="javascript:openTab('按月统计分析','saleMonth.jsp','icon-bklb')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-bklb'" style="width: 150px;">按月统计分析</a>
                </div>

                <div title="系统管理"  data-options="iconCls:'icon-system'" style="padding:10px">
                    <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
                    <a href="javascript:systemHelp()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'" style="width: 150px;">系统帮助</a>
                    <a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
                </div>
            </div>
        </c:if>
	</div>

	
	<!-- 南 -->
	<div region="south" style="height: 30px;padding: 5px;background-color: #E0ECFF" align="center">
		Copyright @ 唐浩荣 版权所有
	</div>


	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 200px;padding: 10px 20px" closed="true" buttons="#dlg-buttons">
	    <form id="fm" method="post">
            <table>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" id="userName" name="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td>原密码：</td>
                    <td><input type="password" id="oldPassword"  class="easyui-validatebox" required="true" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
                </tr>
                <tr>
                    <td>确认新密码：</td>
                    <td><input type="password" id="newPassword2" class="easyui-validatebox" required="true" style="width: 200px"/></td>
                </tr>
            </table>
	    </form>
    </div>

    <div id="dlg-buttons">
        <a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
        <a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>


    <div id="dlg-info" class="easyui-dialog" style="width: 400px;height: 250px;padding: 10px 20px" closed="true" buttons="#dlg-info-buttons">
            <table cellspacing="8px">
                <tr>
                    <td>作  者：</td>
                    <td>唐浩荣</td>
                </tr>
                <tr>
                    <td>学  校：</td>
                    <td></td>
                </tr>
                <tr>
                    <td>制作时间：</td>
                    <td>2018-11-1——2018-12-30</td>
                </tr>
		<tr>
                    <td>QQ：</td>
                    <td>123456</td>
                </tr>
                
            </table>
    </div>
    <div id="dlg-info-buttons">
        <a href="javascript:closeHelpSystem()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>
</body>
</html>