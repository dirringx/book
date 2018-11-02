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
			<div class="btn">
				<input id="addBook" type="button" value="添加书籍" /> 
				<input id="delBook" onclick="delBook()" value="删除" />
			</div>
			<div class="dn" id="addBox">
				<p class="tips">请输入以下教材信息</p>
				<div class="table-box">
					<table id="addTable">
						<thead>
							<tr>
								<th class="dn">所属年级</th>
								<th class="dn">所属学院</th>
								<th class="dn">所属专业</th>
								<th class="number" style="border-left: none;">ISBN</th>
								<th class="name">书名</th>
								<th class="press">出版社</th>
								<th class="subject">所属课程</th>
								<th class="price">价格</th>
								<th class="money">折后价</th>
								<th class="del"></th>
							</tr>
						</thead>
						<tbody id="xtbody">
							<tr>
								<td class="dn"><input type="hidden" name="grade" value="" /></td>
								<td class="dn"><input type="hidden" name="college" value="" /></td>
								<td class="dn"><input type="hidden" name="major" value="" /></td>
								<td style="border-left: none;"><input type="text"
									name="ISBN" /></td>
								<td><input type="text" name="name" /></td>
								<td><input type="text" name="press" /></td>
								<td><input type="text" name="className" /></td>
								<td><input type="text" name="price" /></td>
								<td><input type="text" name="discount" /></td>
								<td class="xx" onclick="saveBook()">添加</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
	<div id="cover" class="dn"></div>
	<script src="${ctx}/styles/js/bookManage.js"></script>
	<script type="text/javascript"
		src="${ctx}/styles/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
		function saveBook() {
			//获取tbody下的所有tr原素
			var tr = $("#xtbody").find("tr");
			//循环tr原素
			$.each(tr, function(i, f) {
				//找到所有input
				var inputs = $(f).find('input');
				//新建对象
				book = {};
				//循环所有inputs，把input中的name和value变成对象中的属性和值
				for (var j = 0; j < inputs.length; j++) {
					var o = inputs[j];
					book[$(o).attr('name')] = $(o).val();
				}
			});
			bookType = {}
			bookType[$('#college').attr('name')] = $('#college').val();
			bookType[$('#grade').attr('name')] = $('#grade').val();
			bookType[$('#major').attr('name')] = $('#major').val();
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
						window.location.href = "${ctx}/admin/t.action?method=find";
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
					if (typeof (result) != undefined && result.status == '200') {
						alert(result.message);
						window.location.href = "${ctx}/admin/t.action?method=find";
					}
					if (typeof (result) != undefined && result.status == '-1') {
						alert(result.message);
						window.location.href = "${ctx}/admin/t.action?method=find";
					}
				}
			});
		}
	</script>
</body>
</html>