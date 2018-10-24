<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="cache-control" content="no-cache"> 
	<meta http-equiv="expires" content="0"> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css"  href="${ctx}/styles/css/operation.css"/>
	<title>Manager</title>
</head>
<body>
<div class="wrap">
        <jsp:include page="/jsp/admin/top.jsp"></jsp:include>
        <div class="choose">
            <input type="button" value="教材管理" id="bookManage">
            <input type="button" value="授权管理" id="grantManage">
        </div>
    </div>
    <script type="text/javascript">
        var bookManage = document.getElementById("bookManage");
        var grantManage = document.getElementById("grantManage");
        bookManage.onclick = function(){
            window.location.href = "${ctx}/admin/m.action?method=book";
        }
        grantManage.onclick = function(){
            window.location.href = "${ctx}/admin/m.action?method=authorize";
        }
    </script>
</body>
</html>