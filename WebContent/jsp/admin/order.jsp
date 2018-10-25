<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/orderManage.css" />
	<title>Index</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="/comm/view/admin/top.jsp"></jsp:include>
        <div class="find">
        	<form id="orderForm" action="${ctx}/order/o.action?method=orderList" method="post">
	            <label for="orderNum">订单号：</label>
	            <input id="orderNum" name="orderNo" type="text" placeholder="请输入订单编号" />
	            <input id="query" type="submit" value="" />
            </form>
        </div>
        <div class="details">
            <div class="order-details">
                <span id="orderNumber">订单号：${order.orderNo}</span>
                <span id="date">生成日期：<fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
            </div>
            <div class="table">
                <table id="table" >
                    <thead>
                        <tr>
                            <th class="isbn">ISBN</th>
                            <th class="name">书名</th>
                            <th class="press">出版社</th>
                            <th class="price">价格</th>
                            <th class="discount">折后价</th>
                            <th class="number">订购数量</th>
                            <th class="money">金额</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<s:iterator value="#session.orderBookList" var="item">
                        <tr>
                            <td>${item.book.ISBN}</td>
                            <td>${item.book.name}</td>
                            <td>${item.book.press}</td>
                            <td>${item.book.price}</td>
                            <td>${item.book.discount}</td>
                            <td>${item.quantity}</td>
                            <td></td>
                        </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
            <span id="total">总额：${order.price}</span>
        </div>
        <button id="modify">修改订单</button>
        <div id="cover" class="dn"></div>
        <div class="dn" id="modifyBox">
            <p class="tips">可修改订购数量</p>
            <div class="table-box">
                <table id="modifyTable" >
                    <thead>
                        <tr>
                            <th class="isbn">ISBN</th>
                            <th class="name">书名</th>
                            <th class="press">出版社</th>
                            <th class="price">价格</th>
                            <th class="discount">折后价</th>
                            <th class="number">订购数量</th>
                            <th class="money">金额</th>
                            <th class="del"></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<s:iterator value="#session.orderBookList" var="item">
                        <tr>
                            <td>${item.book.ISBN}</td>
                            <td>${item.book.name}</td>
                            <td>${item.book.press}</td>
                            <td>${item.book.price}</td>
                            <td>${item.book.discount}</td>
                            <td><input type="text" value="${item.quantity}"/></td>
                            <td></td>
                            <td class="delete"><a href="${ctx}/order/o.action?method=delBook&orderNo=${order.orderNo}&isbn=${item.book.ISBN}">删除</a></td>                          
                        </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
            <div class="btn">
                <input id="confirm" type="button" value="确定" />
                <input id="cancel" type="button" value="取消" />
            </div>
        </div>
    </div>
    <script src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript">
	   var tbody = $("#table tbody");
	   var tr = tbody.find("tr");
	   var sumMoney=0;
	   for(var i=0;i<tr.length;i++){
	       tr[i].children[6].innerHTML = tr[i].children[4].innerHTML*tr[i].children[5].innerHTML;
	       sumMoney +=parseFloat(tr[i].children[6].innerHTML);
	   }
	   $("#total").html("总额："+sumMoney);
	   //修改订单数量，计算金额
	   var input = $("#modifyTable input");
	   var modifyTbody = $("#modifyTable tbody");
	   var modifyTr = modifyTbody.find("tr");
	   for(i=0;i<modifyTr.length;i++){
	       input[i].index = i;
	       modifyTr[i].children[6].innerHTML = modifyTr[i].children[4].innerHTML*input[i].value;
	       //点击删除订单中的某条数据
	       modifyTr[i].children[7].onclick = function(){
	           modifyTbody[0].removeChild(this.parentElement);
	       }
	   }
	   input.change(function(){
	       this.value = parseInt(this.value);
	       modifyTr[this.index].children[6].innerHTML = this.value*modifyTr[this.index].children[4].innerHTML;
	   })
	   $("#modify").click(function(){
	       $("#cover").attr("class","db");
	       $("#modifyBox").attr("class","db");
	   })
	   $("#cancel").click(function(){
	       $("#cover").attr("class","dn");
	       $("#modifyBox").attr("class","dn");
	   })
	   $("#confirm").click(function(){
	       $("#cover").attr("class","dn");
	       $("#modifyBox").attr("class","dn");
	   })
    </script>
</body>
</html>