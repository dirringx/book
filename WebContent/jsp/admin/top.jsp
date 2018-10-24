<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<div class="head">
	<a class="home" href="${ctx}/admin/m.action?method=index">
	    <img src="${ctx}/styles/img/home.png" />
	</a> 
	<span class="teacher">欢迎您，${manager.name}老师</span>
	<a class="loginout" href="${ctx}/admin/a.action?method=logout">退出</a> 
	<img class="border" src="${ctx}/styles/img/border.png" />
</div>