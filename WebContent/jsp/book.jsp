<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/comm/base.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" type="text/css" href="${ctx}/styles/css/book.css"/>
	<title>Index</title>
</head>
<body>
    <h1 class="title">专业书籍</h1>
    <ul id="list">
    	<s:iterator value="#session.bookList" status="i" var="book">
        <li>
            <img class="select-box no" src="${ctx}/styles/img/unselect.png" />
            <img class="book-img" src="${ctx}/styles/${book.bookImage}" />
            
            <div class="information">
                <p class="book-name">${book.name}</p>
                <span class="price">${book.discount}</span>
                <p class="front">折前：<span class="front-price">${book.price}</span></p>
                <span class="number-text">数量：</span>
                <input class="number" type="number" value="0"/>
            </div>
        </li>
        </s:iterator>
    </ul>
    <div class="footer">
    	<form action="${ctx}/order/o.action?method=buy" method="post">
	        <div class="summary">
	            <span class="unselect" id="allSelect">全选</span>
	            <span class="total">合计：<span id="money">¥0.00</span></span>
	            <input id="settlement" type="submit" name="price" value="结算(0)" />
	        </div>
        </form>
		<jsp:include page="/comm/view/NavBar.jsp"></jsp:include>
    </div>
    <script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript">
    var number = 0;
    var all_money = 0.00;
    //选择框
    var select_box = $(".select-box");
    //结算数量
    var settlement =  $("#settlement");
    //全选
    var allSelect = $("#allSelect");
    //合计金额
    var money = $("#money");
    //每本书金额
    var price = $(".price");
    //每本数量
    var book_number = $(".number");
	
	console.log(number)
	console.log(all_money)
	console.log(select_box)
	console.log(settlement)
	console.log(allSelect)
	console.log(money)
	console.log(price)
	console.log(book_number)
	
    //点击全选
    allSelect.click(function(){
        if(this.className == "unselect"){
            this.className = "select";
            for(var i=0;i<select_box .length;i++){
                select_box[i].src = "${ctx}/styles/img/select.png";
                select_box[i].className = "select-box yes";
            }
            number = select_box.length;
            settlement.val("结算"+"("+number+")");
            for(i=0;i<price.length;i++){
                all_money +=parseFloat(price[i].innerHTML)*parseInt(book_number[i].value);
            }
            money.html("¥"+all_money.toFixed(2));
        }
        else{
            this.className = "unselect";
            for(var i=0;i<select_box .length;i++){
                select_box[i].src = "${ctx}/styles/img/unselect.png";
                select_box[i].className = "select-box no";
            }
            number = 0;
            settlement.val("结算"+"("+number+")");
            all_money = 0;
            money.html("¥0.00");
        }
    })
	
    //选择某本书
    for(i=0;i<select_box.length;i++){
        select_box[i].index = i
        book_number[i].index = i;
        book_number[i].count = 1;
		console.log(select_box[i].index)
		console.log(book_number[i].index)
		console.log(book_number[i].count)
		console.log("-----")
    }
	
    $(".select-box").click(function(){
        if(this.className == "select-box no"){
            this.src = "${ctx}/styles/img/select.png";
            this.className = "select-box yes";
            number ++;
            settlement.val("结算"+"("+number+")");
            if(number == select_box.length)
                allSelect.attr("class","select");
            all_money += parseFloat(price[this.index].innerHTML)*parseInt(book_number[this.index].value);
            money.html("¥"+all_money.toFixed(2));
        }
        else{
            this.src = "${ctx}/styles/img/unselect.png";
            this.className = "select-box no";
            number --;
            settlement.val("结算"+"("+number+")");
            if(number<select_box.length && allSelect.attr("class") == "select")
                allSelect.attr("class","unselect");
            all_money -= parseFloat(price[this.index].innerHTML)*parseInt(book_number[this.index].value);
            if(all_money<0)
                money.html("¥0.00");
            else
                money.html("¥"+all_money.toFixed(2));
        }
    })
	
    //书的数量改变
    book_number.change(function(){
        if(select_box[this.index].className == "select-box yes"){
            all_money -= parseFloat(price[this.index].innerHTML)*book_number[this.index].count;
            all_money += parseFloat(price[this.index].innerHTML)*parseInt(book_number[this.index].value);
            book_number[this.index].count = parseInt(book_number[this.index].value);
        }        
        money.html("¥"+all_money.toFixed(2));
    })
    </script>
</body>
</html>