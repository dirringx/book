<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>班级订单详情</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/viewOrder.css" />
</head>
<body>
    <div class="wrap">
        <div class="head">
            <span class="teacher">欢迎您，xxx同学</span>
            <a class="loginout" href="#">退出</a>
            <img class="border" src="${ctx}/styles/img/border.png" />
        </div>
        <h1 class="title">班级订单详细信息</h1>
        <div class="summary">
            <span class="total-num">总数：<span id="totalNum">45</span></span>
            <span class="total-money">金额：<span id="totalMoney">900</span></span>
            <input id="download" type="button" value="下载班级订单详细信息" />
        </div>
        <table id="table" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th class="stu-id">学号</th>
                    <th class="stu-name">姓名</th>
                    <th class="book">软件项目管理</th>
                    <th class="book">概率论数理统计</th>
                    <th class="book">Python程序设计与算法基础教程</th>
                    <th class="book">计算机操作系统</th>
                    <th class="book">编译原理</th>
                    <th class="number">总数</th>
                    <th class="money">金额</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>201610098020</td>
                    <td>张三</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>129</td>
                </tr>
                <tr>
                    <td>201610098020</td>
                    <td>张三</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>129</td>
                </tr>
                <tr>
                    <td>201610098020</td>
                    <td>张三</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>129</td>
                </tr>
                <tr>
                    <td>201610098020</td>
                    <td>张三</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>129</td>
                </tr>
                <tr>
                    <td>201610098020</td>
                    <td>张三</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>129</td>
                </tr>
            </tbody>
        </table>
    </div>
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script>
        $("#table tbody tr:odd").addClass('tr-bg');
    </script>
</body>
</html>