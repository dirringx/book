<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${ctx}/styles/css/orderManage.css" />
    <title>订单管理</title>
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
                    <tbody id="change">
                    	<s:iterator value="#session.orderBookList" var="item">
                        <tr>
                            <td><span class="ISBN">${item.book.ISBN}</span></td>
							<td><span class="name">${item.book.name}</span></td>
							<td><span class="press">${item.book.press}</span></td>
							<td><span class="author">${item.book.author}</span></td>
							<td>${item.book.discount}</td>
                            <td><input id="item_quantity" type="text" name="quantity" value="${item.quantity}"/></td>
                            <td class="${item.id}"></td>
                            <td class="delete"><a href="${ctx}/order/o.action?method=delBookFromOrder&orderNo=${order.orderNo}&isbn=${item.book.ISBN}">删除</a></td>                          
                        </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
            <div class="btn">
                <input id="confirm" type="button" onclick="changeBook()" value="确定" />
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
	   
	   function changeBook() {
		 	//获取tbody下的所有tr原素
			var tr = $("#change").find("tr");
			//新建对象
			bookItem = [];
			//循环tr原素
			$.each(tr, function(i, f) {
				//找到所有input
				var inputs = $(f).find('input');
				//循环所有inputs，把input中的name和value变成对象中的属性和值
				for (var j = 0; j < inputs.length; j++) {
					var o = inputs[j];
					var p = {}
					p[$(o).attr('name')] = $(o).val();
				}
				p['id'] = tr[i].cells[6].className;
				bookItem.push(p)
			});
			
			var url = "${ctx}/order/o.action?method=updateOrder"
			
			$.ajax({
				url : url,
				data : {
					orderItemJson : JSON.stringify(bookItem),
				},
				dataType : "JSON",
				type : "POST",
				cache : false,
				async : false,
				success : function(result) {
					if (typeof (result) != undefined && result.status == '200') {
						alert(result.message);
						window.location.href = "${ctx}/order/o.action?method=orderList&orderNo=${order.orderNo}";
					}
				}
			});
	   }
    </script>
</body>
</html>