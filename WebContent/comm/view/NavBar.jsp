<!-- 导航条模块 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<ul class="nav-list">
	<li id="order"><img class="nav-img" src="${ctx}/styles/img/order.png" /> 
		<span class="nav-text">班级课程</span>
	</li>
	<li id="buy"><img class="nav-img" src="${ctx}/styles/img/buy.png" />
		<span class="nav-text">购物车</span></li>
	<li id="personal"><img class="nav-img" src="${ctx}/styles/img/center.png" /> 
		<span class="nav-text">个人中心</span>
	</li>
</ul>
<script type="text/javascript">
	var order = document.getElementById("order");
	var buy = document.getElementById("buy");
	var personal = document.getElementById("personal");
	order.onclick = function() {
		window.location.href = "${ctx}/book/b.action?method=bookList";
	}
	buy.onclick = function() {
		window.location.href = "${ctx}/order/o.action?method=show";
	}
	personal.onclick = function() {
		window.location.href = "${ctx}/stu/i.action?method=index";
	}
</script>