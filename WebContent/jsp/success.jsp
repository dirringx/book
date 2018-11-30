<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/comm/base.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/css/success.css" />
<title>登录</title>
</head>
<body>
	<img class="success-img" src="${ctx}/styles/img/suss.png" />
	<span class="text">购买成功!</span>
	<footer class="return-text">
		<span id="sp">3</span>秒后返回......
	</footer>
	<script type="text/javascript">
		onload = function() {
			setInterval(go, 1000);
		};
		var x = 3; //利用了全局变量来执行 
		function go() {
			x--;
			if (x > 0) {
				document.getElementById("sp").innerHTML = x; //每次设置的x的值都不一样了。 
			} else {
				location.href = "${ctx}/order/o.action?method=show";
			}
		}
	</script>
</body>
</html>