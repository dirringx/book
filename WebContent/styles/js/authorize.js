var authorize = document.getElementById("authorize");
var stuId = document.getElementById("stuId");
var pop = document.getElementById("pop");
var cover = document.getElementById("cover");
authorize.onclick = function(){
    if(stuId.value != null){
        pop.className = "db";
        cover.className = "db";
    }
}
//var confirm = document.getElementById("confirm");
//var cancel = document.getElementById("cancel");
var cover = document.getElementById("cover");
var pop = document.getElementById("pop");

//确定授权
//confirm.onclick = function(){
//
//}
//cancel.onclick = function(){
//    cover.className = "dn";
//    pop.className = "dn";
//}