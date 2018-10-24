<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>授权管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/authorize.css" />
</head>
<body>
    <div class="wrap">
        <jsp:include page="/jsp/admin/top.jsp"></jsp:include>
        <h1 class="title"><a href="${ctx}/admin/auth.action?method=auth">授权管理</a></h1>
        <form action="${ctx}/admin/auth.action?method=auth" method="post">
	        <div class="lookup">
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
    </div>
    <div id="cover" class="dn"></div>
    <!-- 
    <div id="pop" class="dn">
        <h2>学生信息</h2>
        <ul id="inforList">
            <li>年级：<span class="information">2016级</span></li>
            <li>学号：<span class="information">201610098020</span></li>
            <li>姓名：<span class="information">张三</span></li>
            <li>班级：<span class="information">软件工程五班</span></li>
        </ul>
        <input id="confirm" type="button" value="确定"/>
        <input id="cancel" type="button" value="取消" />
    </div>
     -->
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx}/styles/js/authorize.js"></script>
</body>
</html>