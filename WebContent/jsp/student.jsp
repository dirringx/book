<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<link rel="stylesheet" type="text/css" href="${ctx}/styles/css/personal.css" />
	<title>Student</title>
</head>
<body>
    <div class="message">
        <img id="headPortrait" src="${ctx}/styles/img/profile.png" />
        <p id="name">${student.studentName}</p>
        <p id="stuId">${student.studentID}</p>
        <p id="classes">${student.major}${student.studentClass}班</p>
    </div>
    <ul class="list">
        <li id="change">
            <span>更改密码</span>
            <img class="arrow" src="${ctx}/styles/img/arrow.png" />
        </li>
        <li id="problem">
            <span>问题反馈</span>
            <img class="arrow" src="${ctx}/styles/img/arrow.png" />
        </li>
        <li id="exit">
            <a href="${ctx}/stu/l.action?method=logout"><span>退出登录</span></a>
            <img class="arrow" src="${ctx}/styles/img/arrow.png" />
        </li>
    </ul>
    <jsp:include page="/comm/view/NavBar.jsp"></jsp:include>
</body>
</html>