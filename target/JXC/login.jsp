<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业销售信息管理系统后台登录页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
     
<SCRIPT type="text/javascript">
$(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	});
});

function checkForm(){
	var userName=$("#userName").val();
	var password=$("#password").val();
	var roleId=$("#roleId").val();
	if(userName==null||userName==""){
		$("#error").html("用户名不能为空！");
		return false;
	}
	if(password==null||password==""){
		$("#error").html("密码不能为空！");
		return false;
	}
	if(roleId==null||roleId==""){
        $("#error").html("请选择角色！");
        return false;
    }
	return true;
}
</SCRIPT>
</head>
<body>
<DIV class="top_div">
</DIV>
<form action="${pageContext.request.contextPath}/user/login.do" method="post" onsubmit="return checkForm()">
	<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
		<DIV style="width: 165px; height: 96px; position: absolute;">
			<DIV class="tou">
			</DIV>
			<DIV class="initial_left_hand" id="left_hand">
			</DIV>
			<DIV class="initial_right_hand" id="right_hand">
			</DIV>
		</DIV>
        <P style="padding: 30px 0px 10px; position: relative;">
            <SPAN class="u_logo"></SPAN>
            <INPUT id="userName" name="userName" class="ipt" type="text" placeholder="请输入用户名" value="${user.userName }">
        </P>
        <P style="position: relative;">
            <SPAN class="p_logo"></SPAN>
            <INPUT id="password" name="password" class="ipt"  type="password" placeholder="请输入密码" value="${user.password }">
        </P>
        <P style="padding: 10px 0px 10px; position: relative;">
            <SPAN class="se_logo"></SPAN>
            <select class="ipt" id="roleId" name="roleId" style="width: 337px" >
                <option value="">请选择...</option>
                <option value="1" ${'1'==user.roleId?'selected':'' }>管理员</option>
                <option value="2" ${'2'==user.roleId?'selected':'' }>经理</option>
                <option value="3" ${'3'==user.roleId?'selected':'' }>采购主管</option>
                <option value="4" ${'4'==user.roleId?'selected':'' }>销售主管</option>
            </select>
        </P>
		<DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			<P style="margin: 0px 35px 20px 45px;">
			<SPAN style="float: left;">企业销售信息管理系统</SPAN>
			<span><font color="red" id="error">${errorMsg }</font></span>
	        <SPAN style="float: right;"> 
	              <input type="submit" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" value="登录"/> 
	         </SPAN>         
	         </P>
	    </DIV>
	</DIV>
</form>

<div style="text-align:center;padding-top: 100px">
Copyright © 唐浩荣 版权所有
</div>
</body>
</html>