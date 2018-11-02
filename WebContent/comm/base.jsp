<%@ page language="java" pageEncoding="UTF-8"%>
<%
	//下述代码，用来取得实际文件所在的文件夹，计算出 basePath
	String path = request.getContextPath();
	//取得文件所在的文件夹，并且取得最后一个 "/" 的部分
	String path1 = request.getServletPath();
	int baseIndex = path1.lastIndexOf("/");
	String path2 = path1.substring(0, baseIndex);
	String rootPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + path2 + "/";
	request.setAttribute("basepath", basePath);
	request.setAttribute("rootpath", rootPath);
%>
<base href="<%=request.getAttribute("basepath")%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="icon" href="<%=request.getAttribute("rootpath")%>/favicon.ico" type="image/x-icon" /> 
