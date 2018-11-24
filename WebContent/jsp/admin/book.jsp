<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/comm/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/comm/base.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${ctx}/styles/css/bookManage.css" />
<title>教材管理</title>
</head>
<body>
	<div class="wrap">
		<nav class="nav">
	        <img src="${ctx}/styles/img/home.png" />
	        <a class="book-manage bg" href="${ctx}/admin/m.action?method=book">教材管理</a>
	        <a class="authorize" href="${ctx}/admin/m.action?method=authorize">学委管理</a>
	    </nav>
		<div class="center">
			<jsp:include page="/comm/view/admin/top.jsp"></jsp:include>
			<c:if test="${not empty manager.name and manager.name ne 'unseted'}">
				<h1 class="title">教材管理</h1>
				<form action="${ctx}/admin/t.action?method=find" method="post">
					<div class="choose">
						<label>学院：</label>
						<div class="college-list">
							<input class="take-up" id="college" name="college" type="text"
								value="计算机工程学院" readonly="readonly" />
							<ul class="dn" id="collegeList">
								<li>计算机工程学院</li>
								<li>管理学院</li>
								<li>外国语学院</li>
							</ul>
						</div>
						<label>年级：</label>
						<div class="grade-list">
							<input class="take-up" id="grade" name="grade" type="text"
								value="2016" readonly="readonly" />
							<ul class="dn" id="gradeList">
								<li>2018</li>
								<li>2017</li>
								<li>2016</li>
								<li>2015</li>
							</ul>
						</div>
						<label>专业：</label>
						<div class="major-list">
							<input class="take-up" id="major" name="major" type="text"
								value="软件工程" readonly="readonly" />
							<ul class="dn" id="majorList">
								<li>软件工程</li>
								<li>计算机科学与技术</li>
								<li>网络工程</li>
								<li>信息与计算科学</li>
							</ul>
						</div>
						<input id="chooseConfirm" type="submit" value="确定" />
					</div>
				</form>
				<img class="table-head" src="${ctx}/styles/img/table_head_bg.png" />
		
				<table id="table">
					<thead>
						<tr>
							<th class="number">ISBN</th>
							<th class="name">书名</th>
							<th class="press">出版社</th>
							<th class="author">作者</th>
							<th class="price">价格</th>
							<th class="money">折后价</th>
							<th class="unselect"></th>
						</tr>
					</thead>
					<tbody id="tb">
						<s:iterator value="#session.books" var="book">
							<tr>
								<td><span class="ISBN">${book.ISBN}</span></td>
								<td><span class="name">${book.name}</span></td>
								<td><span class="press">${book.press}</span></td>
								<td><span class="author">${book.author}</span></td>
								<td><span class="price">${book.price}</span></td>
								<td><span class="discount">${book.discount}</span></td>
								<td class="unselect"></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<button id="addBook">添加数据</button>
		        <form id="btn" class="btn" method="POST" action="http://bookexcel.yogasol.xin/api/send" enctype="multipart/form-data">
		               <input id="file" type="file" name="data" multiple="multiple" value="请选择文件"/>
		               <input id="importBook" type="button" value="导入excel表" />
		               <input id="delBook" type="button" value="删除" />
		        </form>
				<div class="dn" id="addBox">
		               <p class="tips">请输入以下教材信息</p>
		               <form class="form">
		                   <label for="isbn">ISBN：</label>
		                   <input type="text" id="isbn" name="ISBN" />
		                   <label for="name">书名：</label>
		                   <input type="text" id="name" name="name" />
		                   <label for="press">出版社：</label>
		                   <input type="text" id="press" name="press" />
		                   <label for="subject">所属课程：</label>
		                   <input type="text" id="subject"name="className" />
		                   <label for="price">价格：</label>
		                   <input type="text" id="price" name="price" />
		                   <label for="discount">折后价：</label>
		                   <input type="text" id="discount" name="discount"/>
		               </form>
		               <div class="button">
		                   <input id="addConfirm" type="button" value="确定" />
		                   <input id="addCancel" type="button" value="取消" />
		               </div>
		           </div>
			</c:if>
		</div>
	</div>
	<div id="cover" class="dn"></div>
	<script type="text/javascript" src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
	<!-- <script type="text/javascript" src="${ctx}/styles/js/ajaxfileupload.js"></script> -->
    <!-- <script type="text/javascript" src="${ctx}/styles/js/spin.min.js"></script> -->
	<script type="text/javascript" src="${ctx}/styles/js/bookManage.js"></script>
	
	<script>
		returnURL = "${ctx}/admin/t.action?method=find&major="+ $('#major').val() + "&grade=" + $('#grade').val();
		var form = addBox.getElementsByTagName("form");
		function saveBook() {
		    //获取input
		    var input = $(form).find("input");
		    //新建对象
		    book = {};
		    //循环所有inputs，把input中的name和value变成对象中的属性和值
		    for (var j = 0; j < input.length; j++) {
		        var o = input[j];
		        book[$(o).attr('name')] = $(o).val();
		    }
		    bookType = {}
		    bookType["college"] = $('#college').val();
		    bookType["grade"] = $('#grade').val();
		    bookType["major"] = $('#major').val();
		    book = JSON.stringify(book)
		    bookType = JSON.stringify(bookType)
		    url = "${ctx}/book/b.action?method=addBook";
		    $.ajax({
		        url : url,
		        data : {
		            bookJson : book,
		            bookTypeJson : bookType
		        },
		        dataType : "JSON",
		        type : "POST",
		        cache : false,
		        async : false,
		        success : function(result) {
		            if (typeof (result) != undefined && result.status == '200') {
		                alert(result.message);
		                window.location.href = returnURL;
		            }
		            if (typeof (result) != undefined && result.status == '-1') {
		                alert(result.message);
		                window.location.href = returnURL;
		            }
		        }
		    });
		}
	
		function delBook() {
			//获取tbody下的所有tr原素
			var tr = $("#tb").find("tr");
			//新建对象
			delbook = [];
			//循环tr原素
			$.each(tr, function(i, f) {
				if(tr[i].cells[6].className == 'select'){
					//找到所有span
					var spans = $(f).find('span');
					var b = {};
					//循环所有span，把span中的class和标签中的内容变成对象中的属性和值
					for (var j = 0; j < spans.length; j++) {
						var o = spans[j];
						b[$(o).attr('class')] = $(o).html();
					}
					delbook.push(b);
				}
			});
			url = "${ctx}/book/b.action?method=delBook";
			$.ajax({
				url : url,
				data : {
					bookJson : JSON.stringify(delbook)
				},
				dataType : "JSON",
				type : "POST",
				cache : false,
				async : false,
				success : function(result) {
					alert(result);
					if (typeof (result) != undefined && result.status == '200') {
						alert(result.message);
						window.location.href = returnURL;
					}
					if (typeof (result) != undefined && result.status == '-1') {
						alert(result.message);
						window.location.href = returnURL;
					}
				}
			});
		}
	</script>
</body>
</html>