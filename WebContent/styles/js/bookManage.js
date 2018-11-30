var addBook = document.getElementById("addBook");
var addBox = document.getElementById("addBox");
var addConfirm = document.getElementById("addConfirm");
var addCancel = document.getElementById("addCancel");
var cover = document.getElementById("cover");


var table = document.getElementById("table");
var thead = table.getElementsByTagName("thead")[0];
var tbody = table.getElementsByTagName("tbody")[0];
var selected = 0;


var college = document.getElementById("college");
var collegeList = document.getElementById("collegeList");
var college_li = collegeList.getElementsByTagName("li");
//选择学院
college.onclick = function(){
    gradeList.className = "dn";
    majorList.className = "dn";
    collegeList.className = "db";
}
for(var i=0;i<college_li.length;i++){
    college_li[i].onclick = function(){
        college.value = this.innerText;
        collegeList.className = "dn";
    }
}
var grade =  document.getElementById("grade");
var gradeList = document.getElementById("gradeList");
var grade_li = gradeList.getElementsByTagName("li");
//选择年级
grade.onclick = function(){
    majorList.className = "dn";
    collegeList.className = "dn";
    gradeList.className = "db";
}
for(i=0;i<grade_li.length;i++){
    grade_li[i].onclick = function(){
        grade.value = this.innerText;
        gradeList.className = "dn";
    }
}
var major = document.getElementById("major");
var majorList = document.getElementById("majorList");
var major_li = majorList.getElementsByTagName("li");
//选择专业
major.onclick = function(){
    gradeList.className = "dn";
    collegeList.className = "dn";
    majorList.className = "db";
}
for(i=0;i<major_li.length;i++){
    major_li[i].onclick = function(){
        major.value = this.innerText;
        majorList.className = "dn";
    }
}
thead.rows[0].cells[6].onclick = function(){
    if(this.className == "unselect"){
        this.className = "select";
        selected = tbody.rows.length;
        for(var i=0;i<tbody.rows.length;i++){
            tbody.rows[i].cells[6].className = "select";
        }
    }
    else if(this.className == "select"){
        this.className = "unselect";
        selected = 0;
        for(var i=0;i<tbody.rows.length;i++){
            tbody.rows[i].cells[6].className = "unselect";
        }
    }
}
for(var i=0;i<tbody.rows.length;i++){
    tbody.rows[i].cells[6].onclick = function(){
        if(this.className == "unselect"){
            this.className = "select";
            selected++;
            if(selected == tbody.rows.length)
                thead.rows[0].cells[6].className = "select";
        }
        else{
            this.className = "unselect";
            selected--;
            if(thead.rows[0].cells[6].className == "select")
                thead.rows[0].cells[6].className = "unselect";
        }
    }
}

//点击添加书籍
addBook.onclick = function(){
    cover.className = "db";
    addBox.className = "db";
}
//点击删除
 var delBook = document.getElementById("delBook");
 delBook.onclick = function(){
	 delBook();
//     if(selected >0){
//         for(var i=0;i<tbody.rows.length;){
//             if(tbody.rows[i].cells[6].className == "select"){
//                 thead.rows[0].cells[6].className = "unselect";
//                 tbody.removeChild(tbody.rows[i]);
//                 selected--;
//             }
//             else
//                 i++;
//         }
//     }
//     else{
//         alert("请选择要删除的书籍");
//     }
 }

//取消添加
addCancel.onclick = function(){
    cover.className = "dn";
    addBox.className = "dn";
}
//确认添加
addConfirm.onclick = function(){
    saveBook();
}
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
    alert(book);
    alert(bookType);
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
//上传cexel
 var updataFile = document.getElementById("file");
 console.log(updataFile);
 updataFile.onchange = function(){
     //加载中...
     var opts = {
         lines: 13,
         length: 20,
         width: 10,
         radius: 30,
         corners: 1,
         rotate: 0,
         direction: 1,
         color: '#dcdcdc',
         speed: 1,
         trail: 60,
         shadow: false,
         hwaccel: false,
         className: 'spinner',
         zIndex: 2e9,
         top: '50%',
         left: '50%'
     };

     var excelNmae = updataFile.value;
     console.log(excelNmae)
     var fileTarr = excelNmae.split(".");
     console.log(fileTarr)
     //切割出后缀文件名
     var filetype = fileTarr[fileTarr.length-1];
     console.log(filetype)
     if(filetype == "xlsx" || filetype == "xls"){
         cover.className="db";
         var spinner = new Spinner(opts).spin(cover);
         //传文件
         $.ajaxFileUpload({
             url:'http://bookexcel.yogasol.xin/api/send',
             type:'POST',
             secureuri: false,
             fileElementId:'file',
             dataType:'json',
             cache : false,
		     async : false,
             success:function(result){
            	 alert(result)
             },
             error : function(){
             }
         })
     }
     else{
         alert("请上传正确的excel文件");
     }
 }