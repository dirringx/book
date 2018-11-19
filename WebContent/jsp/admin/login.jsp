<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css"  href="${ctx}/styles/css/administratorLogin.css"/>
	<title>管理员登陆</title>
</head>
<body>
 <div class="wrap">
    <h1 class="title">教材订购系统</h1>
    	<span style="position: absolute;left:150px;top:50px;text-align:center;color:red;">${msg}</span>
      	<form action="${ctx}/admin/a.action?method=login" method="post">
            <div class="user">
                <label for="username">工号：</label>
                <input type="text" id="username" name="workNumber" class="required" maxlength="8">
            </div>
            <div class="psd">
                <label for="psd">密码：</label>
                <input type="password" id="psd" name="password" class="required" maxlength="8">
            </div>
            <!-- 
	            <div class="verification">
	                    <label for="verification">验证码：</label>
	                    <input type="text" id="verification" class="required">
	                    <img class="code" src="${ctx}/styles/img/code.png" />
	                    <a class="change" href="#">换一换</a>
	            </div>
             -->
            <div class="pos">
                <input id="dean" name="permission" type="radio" value="1" checked="checked">
                <label for="dean">教务员</label>
                <input id="administrator" name="permission" type="radio" value="2" >
                <label for="administrator">管理员</label>
            </div>
            <div class="startLogin">
                <input id="login" type="submit" value="登录">
                <input type="reset" value="清除">
            </div>
        </form>
    </div>
</body>
</html>