<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<div class="head">
  <c:choose>
    <c:when test="${not empty manager.name and manager.name ne 'unseted'}">
      <span class="teacher">欢迎您，${manager.name}</span>
      <a class="loginout" href="${ctx}/admin/a.action?method=logout">退出</a>
    </c:when>
    <c:otherwise>
      <span class="teacher">未登录！</span>
      <a class="loginout" href="${ctx}/admin/m.action?method=toLogin">登陆</a>
       </c:otherwise>
     </c:choose>
  <img class="border" src="${ctx}/styles/img/border.png" />
</div>