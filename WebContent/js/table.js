    var teachers = new Array(); //教师数组
	var counts=1;               //当前页数
	var number=0;               //总页数
	var id;           //学号
	var name;                //姓名
	var sex;
	var birthday;
	var salary;
	var college;
	var major;
	//onload 事件会在页面或图像加载完成后立即发生。
	window.onload=function(){
		displaypage();
	}
	function createAll(Teachers){
		for(teacher in Teachers){
			var T = new Object();
			T.id = teacher.id;
			T.name = teacher.name;
			T.sex = teacher.sex;
			T.birthday = teacher.birthday;
			T.salary = teacher.salary;
			T.college = teacher.college;
			T.major = teacher.major;
			teachers.push(T);
		}
	}
	//显示页数
	function displaypage(){
		var footerLeft = document.getElementById("footerLeft");
		footerLeft.innerHTML=("第 "+counts+" 页，共 "+ teachers.length+" 条，（每页显示10条）");

	}
	//每一行前可点的东西
	var ocheckbox = new Array();
	for(var i=0;i<10;i++){
		ocheckbox[i] = document.createElement("input");
		ocheckbox[i].type = "checkbox";
		ocheckbox[i].style = "zoom:150%;";	
	}
	//翻页
	function page(){


		var tab = document.getElementById("tab");

		var count = (counts-1)*10;

		for(var num = 1;num < 11 ; num ++){

			var teacher= teachers[num+count-1];

			if(num + count < teachers.length+1){

				tab.rows[num].cells[0].appendChild(ocheckbox[num-1]);
				tab.rows[num].cells[1].innerHTML=count+num;
				tab.rows[num].cells[2].innerHTML=teacher.id;
				tab.rows[num].cells[3].innerHTML=teacher.name;
				tab.rows[num].cells[4].innerHTML=teacher.sex;
				tab.rows[num].cells[5].innerHTML=teacher.birthday;
				tab.rows[num].cells[6].innerHTML=teacher.salary;
				tab.rows[num].cells[7].innerHTML=teacher.college;
				tab.rows[num].cells[8].innerHTML=teacher.major;	
				tab.rows[num].cells[9].innerHTML="<img src='img/查看.png'/>";			
				tab.rows[num].cells[10].innerHTML="<img src='img/修改.png'/>";
				tab.rows[num].cells[11].innerHTML="<img src='img/删除.png'/>";

			}
			else{
				tab.rows[num].cells[0].innerHTML="";
				tab.rows[num].cells[3].innerHTML="";
				tab.rows[num].cells[1].innerHTML="";
				tab.rows[num].cells[2].innerHTML="";
				tab.rows[num].cells[4].innerHTML="";
				tab.rows[num].cells[5].innerHTML="";
				tab.rows[num].cells[6].innerHTML="";
				tab.rows[num].cells[7].innerHTML="";
				tab.rows[num].cells[8].innerHTML="";
				tab.rows[num].cells[9].innerHTML="";
				tab.rows[num].cells[10].innerHTML="";
				tab.rows[num].cells[11].innerHTML="";

			}
			displaypage();
		}
	}

	//.checked 判断是否被选中
	//最后一页翻页提示  要
	function nextPageBegin(){

		var number = teachers.length/10;

		if(counts<number){
			counts++;
		  	page();
		}
		else{
			alert("这是最后一页了！");
		}
		for(var i=0;i<ocheckbox.length;i++){
			ocheckbox[i].checked=false;		
		}
		displaypage();
	}

	//第一页向前翻页提示   要
	function lastPageBegin(){

		if(counts>1){
			counts--;
		  	page();
		}
		else{
			alert("这是第一页！");
		}
		for(var i=0;i<ocheckbox.length;i++){
		ocheckbox[i].checked=false;		
		}
		displaypage();
	}

	//最上面选中所有的
	function allclick(obj){

		if(obj){
			for(var i=0;i<ocheckbox.length;i++){
				ocheckbox[i].checked=true;	
			}
		}
		else{
			for(var i=0;i<ocheckbox.length;i++){
				ocheckbox[i].checked=false;	
			}
		}
	}
	//空值
	function emptyvalue(){

		document.getElementById("addid").innerHTML="";
		document.getElementById("addname").innerHTML="";
		document.getElementById("addsex").innerHTML="";
		document.getElementById("addbirthday").innerHTML="";
		document.getElementById("addsalary").innerHTML="";
		document.getElementById("addcollege").innerHTML="";
		document.getElementById("addmajor").innerHTML="";
		alert(document.getElementById("addid").value);
	}

	//增加信息  要

	function addInterface(){

		var t1 =document.getElementById("inter");
		t1.style.display='block';

		var t2 =document.getElementById("addinter");
		t2.style.display='block';

	}
	//确认添加 并添加
	function ensure(){	

			id=document.getElementById("addid").value;
			namevalue=document.getElementById("addname").value;
			sex=document.getElementById("addsex").value;
			birthday=document.getElementById("addbirthday").value;
			salary=document.getElementById("addsalary").value;
			college=document.getElementById("addcollege").value;
			major=document.getElementById("addmajor").value;	

			var teacher = new Object();	

			teacher.id=id;	
			teacher.name=name;
			teacher.collage=sex;
			teacher.birthday=birthday;
			teacher.salary=salary;
			teacher.college=college;
			teacher.major=major;

			teachers.push(teacher);
			CancelInterface();
			page();
	}
 
	// 要
	function deleteEnsure(){
		if(confirm("您确定要删除吗？"))
		deleteElement();
		else
		CancelInterface();
	}

	//删除信息  每行后面
	function deleteThis(num) {
		if(confirm("您确定要删除吗？")){
			var obj =(num-1)+(counts-1)*10;
			teachers.splice(obj,1);
			for(var i=0;i<ocheckbox.length;i++){
				ocheckbox[i].checked=false;		
			}
			page();
			document.getElementById("all").checked=false;
			CancelInterface();
		}
		
	}


	//查看信息

	function checkInterface(num){	

		var obj =(num-1)+(counts-1)*10;

		var t1 =document.getElementById("inter");
		t1.style.display='block';
		var t2 =document.getElementById("checkinter");
		t2.style.display='block';

		document.getElementById("checkid").value=teachers[obj].id;
		document.getElementById("checkname").value=teachers[obj].name;
		document.getElementById("checksex").value=teachers[obj].sex;
		document.getElementById("checkbirthday").value=teachers[obj].birthday;
		document.getElementById("checksalary").value=teachers[obj].salary;
		document.getElementById("checkcollege").value=teachers[obj].college;
		document.getElementById("checkmajor").value=teachers[obj].major;
		
	}

	//修改信息
	function amendInterface(num){

		var t1 =document.getElementById("inter");
		t1.style.display='block';
		var t2 =document.getElementById("amendinter");
		t2.style.display='block';
		var obj =(num-1)+(counts-1)*10;
		
		document.getElementById("amendid").value=teachers[obj].id;
		document.getElementById("amendname").value=teachers[obj].name;
		document.getElementById("amendsex").value=teachers[obj].sex;
		document.getElementById("amendbirthday").value=teachers[obj].birthdat;
		document.getElementById("amendsalary").value=teachers[obj].salary;
		document.getElementById("amendcollege").value=teachers[obj].college;
		document.getElementById("amendmajor").value=teachers[obj].major;
		a=obj;
	}

	//修改确定

	function amendensure(){

		teachers[a].id=document.getElementById("amendid").value;	
		teachers[a].name=document.getElementById("amendname").value;
		teachers[a].sex=document.getElementById("amendsex").value;
		teachers[a].birthday=document.getElementById("amendbirthday").value;
		teachers[a].salary=document.getElementById("amendsalary").value;
		teachers[a].college=document.getElementById("amendcollege").value;
		teachers[a].major=document.getElementById("amendmajor").value;

		CancelInterface();
		page();
	}


	//取消界面显示


	function CancelInterface(){
		var t1 =document.getElementById("inter");
		t1.style.display='none';

		var t2 =document.getElementById("addinter");
		t2.style.display='none';

		var t3 =document.getElementById("checkinter") 
		t3.style.display='none';

		var t4 =document.getElementById("amendinter") 
		t4.style.display='none';

		//var t5 =document.getElementById("deleteinter") 
		//t5.style.display='none';
	}
	//删除元素

	function deleteElement(){
		var j = 0;
		if(document.getElementById("all").checked==true){
			teachers.length=0;
		}	
		else{
			for(var i=0;i<ocheckbox.length;i++){
				if(ocheckbox[i].checked){
					teachers.splice(i-j+(counts-1)*10,1);
					j++;
				}
			}	
		}	
		for(var i=0;i<ocheckbox.length;i++){
			ocheckbox[i].checked=false;		
		}
		page();
		document.getElementById("all").checked=false;
		CancelInterface();
	}

	//修改判断
	function amendjudgevalue(){
		var judge = true;

		for (var i = teachers.length - 1; i >= 0; i--) {
			if(document.getElementById("amendid").value==teachers[i].teacherNum){
				alert("教师编号重复，请重新输入");
				document.getElementById("amendid").focus();
				judge=false;
				return;
			}
		}
		
		if(!isteacherNo(document.getElementById("amendid").value)){
			alert("教师编号是11位数字");
			document.getElementById("amendid").focus();
			judge=false;
			return;
		}
		if(!ischina(document.getElementById("amendname").value)){
			alert("教师姓名必须填写中文");
			document.getElementById("amendname").focus();
			judge=false;  
			return;
		}

		if(!ischinacollage(document.getElementById("amendsex").value)){
			alert("请填写性别");
			document.getElementById("amendcollage").focus();
			judge=false;  
			return;
		}
		if(!ischinamajor(document.getElementById("amendbirthday").value)){
			alert("请填写生日");
			document.getElementById("amendbirthday").focus();
			judge=false;  
			return;
		}	
		if(!isteachergrade(document.getElementById("amendsalary").value)){
			alert("请正确填写薪水");
			document.getElementById("amendsalary").focus();
			judge=false;
			return;
		}
		if(!isteacherclass(document.getElementById("amendcollege").value)){
			alert("请正确填写班级");
			document.getElementById("amendcollege").focus();
			judge=false;
			return;
		}
		if(!isteacherage(document.getElementById("amendmajor").value)){
			alert("请正确填写年龄");
			document.getElementById("amendmajor").focus();
			judge=false;
			return;
		}
			
//		alert("修改正确，请点击确定提交");
		amendensure();	
	}

	//添加判断

	function judgevalue(){
		var judge = true;

		for (var i = teachers.length - 1; i >= 0; i--) {
			if(document.getElementById("addid").value==teachers[i].teacherNum){
				alert("教师编号重复，请重新输入");
				document.getElementById("amendid").focus();
				judge=false;
				return;
			}
		}
		
		if(!isteacherNo(document.getElementById("addid").value)){
			alert("教师编号是11位数字");
			document.getElementById("addid").focus();
			judge=false;
			return;
		}
		if(!ischina(document.getElementById("addname").value)){
			alert("教师姓名必须填写中文");
			document.getElementById("addname").focus();
			judge=false;  
			return;
		}

		if(!ischinacollage(document.getElementById("addcollage").value)){
			alert("请填写学院中文名");
			document.getElementById("addcollage").focus();
			judge=false;  
			return;
		}
		if(!ischinamajor(document.getElementById("addmajor").value)){
			alert("请填写专业中文名");
			document.getElementById("addmajor").focus();
			judge=false;  
			return;
		}	
		if(!isteachergrade(document.getElementById("addgrade").value)){
			alert("年级是4位数字");
			document.getElementById("addgrade").focus();
			judge=false;
			return;
		}
		if(!isteacherclass(document.getElementById("addclass").value)){
			alert("请正确填写班级");
			document.getElementById("addclass").focus();
			judge=false;
			return;
		}
		if(!isteacherage(document.getElementById("addage").value)){
			alert("请正确填写年龄");
			document.getElementById("addage").focus();
			judge=false;
			return;
		}
//		alert("输入正确，请点击确定提交");
		ensure();	
	}

	//正则规范方法集合
	function isteacherNo(str) {
		var reg=/^[0-9]{11}$/;  
		return reg.test(str);     
	}
	function ischina(str) {
		var reg=/^[\u4E00-\u9FA5]{2,4}$/;   
		return reg.test(str);   
	}
	function ischinacollage(str) {
		var reg=/^[\u4E00-\u9FA5]{2,20}$/;   
		return reg.test(str);   
	}
	function ischinamajor(str) {
		var reg=/^[\u4E00-\u9FA5]{2,4}$/;   
		return reg.test(str);   
	}
	function isteachergrade(str) {
		var reg=/^[0-9]{4}$/;   
		return reg.test(str);    
	}
	function isteacherclass(str) {
		var reg=/^[0-9]{1,4}$/;   
		return reg.test(str);    
	}
	function isteacherage(str) {
		var reg=/^[0-9]{2,3}$/;   
		return reg.test(str);    
	}