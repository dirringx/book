<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>授权管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/authorize.css" />
</head>
<body>
    <div class="wrap">
    	<jsp:include page="/comm/view/admin/top.jsp"></jsp:include>
    	<c:if test="${not empty manager.name and manager.name ne 'unseted'}">
        	<h1 class="title">授权管理</h1>
        	<form action="${ctx}/admin/auth.action?method=auth" method="post">
	        	<div class="lookup">
	        		<c:if test="${not empty msg and msg ne 'unseted'}">
	            		<span>提示：${msg}</span>
	            	</c:if>
	            	<label for="stuId">学号：</label>
	            	<input id="stuId" name="studentID" type="text" />
	            	<button type="submit" id="authorize">授权</button>     
	        	</div>
        	</form>
        	<img class="table-head" src="${ctx}/styles/img/table_head_bg.png" />  
        	<table id="table" >
           		<thead>
                	<tr>
                    	<th class="grade">年级</th>
                    	<th class="id">学号</th>
                    	<th class="name">姓名</th>
                    	<th class="major">班级</th>
                    	<th class="operate"></th>
                	</tr>
            	</thead>
            	<tbody>
            		<s:iterator value="#request.stu" var="s">
                	<tr>
                    	<td>${s.grade}</td>
                   	 	<td>${s.studentID}</td>
                    	<td>${s.studentName}</td>
                    	<td>软件工程${s.studentClass}班</td>
                    	<td class="cancel"><a href="${ctx}/admin/auth.action?method=noAuth&studentID=${s.studentID}">取消授权</a></td>
                	</tr>
                	</s:iterator>
            	</tbody>
        	</table>
        </c:if>
    </div>
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/styles/js/authorize.js"></script>
</body>
</html>