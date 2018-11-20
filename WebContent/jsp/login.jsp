<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
 <head>
 	<%@include file="/comm/base.jsp"%>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/login.css">
    <title>登录</title>
  </head>
  <body>
    <img class="logo" src="${ctx}/styles/img/logo.png" />
    <form class="form" action="${ctx}/stu/l.action?method=login" method="post">
    <span>
	  <c:if test="${not empty msg and msg ne 'unseted'}">
	  ${msg}
	  </c:if>
	</span>    
      <input id="user" name="studentName" type="text" placeholder="请输入账号" maxlength="12"/>
      <input id="password" name="password" type="password" placeholder="请输入密码" maxlength="16"/>
      <input id="login" type="submit" value="Login"/>
    </form>
    <footer class="footer">学生购书登录</footer>
    <script src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript">
    </script>
  </body>
</html>