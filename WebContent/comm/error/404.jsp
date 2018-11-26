<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
 <head>
 	<%@include file="/comm/base.jsp"%>
    <title>error</title>
    <style type="text/css">
	  a{text-decoration:none; out-line: none; color: black;}
    </style>
  </head>
  <body>
  	<div align="center">
	  <h2>
	    <a href="${ctx}/stu/l.action?method=toLogin">404</a>
	  </h2>
	  <p>
	  	<%
          out.println(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()).toString());
     	%>
	  </p>
  	</div>
  </body>
</html>