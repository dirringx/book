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
//    if(selected >0){
//        for(var i=0;i<tbody.rows.length;){
//            if(tbody.rows[i].cells[6].className == "select"){
////                thead.rows[0].cells[6].className = "unselect";
//                tbody.removeChild(tbody.rows[i]);
//                selected--;
//            }
//            else
//                i++;
//        }
       
//    }
//    else{
//        alert("请选择要删除的书籍");
//    }
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

//上传文件
var btn = document.getElementById("btn");
var updataFile = document.getElementById("file");
updataFile.onchange = function(){
	alert("111");
	btn.submit();
}
