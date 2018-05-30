<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="edu.cqut.hr.service.TeacherService,edu.cqut.hr.model.Teacher,edu.cqut.hr.dao.TeacherDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>教师管理系统</title>
<%
TeacherService teacherService = new TeacherDao();
List<Teacher>  Teachers = teacherService.queryAll();
%>
<head>
	<meta charset="utf-8">
	<title>教师信息管理系统</title>
	<link rel="stylesheet" type="text/css" href="./css/table.css">
	<script>
    var teachers = new Array(); //教师数组
	var counts=1;               //当前页数
	var number=0;               //总页数
	var id;                     //ID
	var name;                   //姓名
	var sex;                    //性别
	var birthday;               //生日
	var salary;                 //薪水
	var college;                //学院
	var major;                  //专业
	//onload 事件会在页面或图像加载完成后立即发生。
	window.onload=function(){
		displaypage();
	}
	function createAll(){
		
		<% for(int i = 0; i < Teachers.size(); i ++){%>
			var T = new Object();
			T.id = "<%= Teachers.get(i).getId() %>";
			T.name = "<%= Teachers.get(i).getName() %>";
			T.sex = "<%= Teachers.get(i).getSex() %>";
			T.birthday = "<%= Teachers.get(i).getBirthday() %>";
			T.salary = "<%= Teachers.get(i).getSalary() %>";
			T.college = "<%= Teachers.get(i).getCollege() %>";
			T.major = "<%= Teachers.get(i).getMajor() %>";
			teachers.push(T);
		
		<% }%>
		page();
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
		document.getElementById("amendbirthday").value=teachers[obj].birthday;
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
	</script>
</head>
<body onload="createAll()">
	<div class="all">
		<!-- 顶部，包括新增和删除两个按钮 -->
		<div class="head">
			<div class="headTop">
				<div class="titleline"></div>
				<div class="title">教师信息管理系统</div>
				<div class="titleline"></div>
			</div>
			<div class="headBottom">
				<form>	
					<input class="addButton" type="button" value="新增" onclick="addInterface()">
					<input class="deleteButton" type="button" value="删除" onclick="deleteEnsure()" >
				</form>
			</div>
		</div>

		<div class="content">
			<table class="tab" id="tab">
				<tr class="backGroundColor1">
					<th><form><input name="allseclect" type="checkbox"style="zoom:150%;" id="all" onclick="allclick(all.checked)"></form></th>
					<th>序号</th><th>ID</th><th>Sex</th><th>Name</th>
					<th>Birthday</th><th>salary</th><th>College</th><th>major</th>
					<th colspan="3">操作</th>
				</tr>
				
				<% for(int n = 0; n < 10 ; n++) {%>
				<tr class="backGroundColor<%=n%2%>">
					<td></td><td></td><td></td><td></td><td></td>
					<td></td><td></td><td></td><td></td>
					<td class="operator1" onclick="checkInterface(<%= n+1 %>)"></td>
					<td class="operator2" onclick="amendInterface(<%= n+1 %>)"></td>
					<td class="operator3" onclick="deleteThis(<%= n+1 %>)"></td>
				</tr>
				
				<% }%>
			</table>
		</div>
		
		<div class="footer">
			<div class="footerLeft" id="footerLeft">
			</div>

			<div class="footerRight">
				<form>
				<input class="downButton" type="button" onclick="nextPageBegin()" value="下一页">
				<input class="upButton" type="button" onclick="lastPageBegin()" value="上一页">
				</form>
			</div>
		</div>

	</div>

	<!--新界面的背景-->
	<div class="backGroundColor" id="inter">
	</div>
	<!--教师信息添加界面-->
	<div class="addInterface" id="addinter">
		<div class="interface-top">		
			新增教师信息
		</div>

		<div class="interface-middle">
			<from id="interface-from" action="submit">
				ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addid" type="text" placeholder="请输入ID"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addname" type="text" placeholder="请输入姓名"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addsex" type="text" placeholder="请输入性别"><br><br>
				Birthday&nbsp&nbsp<input id="addbirthday" type="text" placeholder="请输入生日"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addsalary" type="text" placeholder="请输入薪水"><br><br>
				College&nbsp&nbsp&nbsp<input id="addcollege" type="text" placeholder="请输入学院"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="addmajor" type="text" placeholder="请输入专业"><br><br>
			</from>
		</div>

		<div class="interface-bottom">
			<form id="after-from">
				<input class="submitButton" type="button" value="提交" 
				onclick="judgevalue()">
				<input class="CancelButton" type="button" value="取消" 
				onclick="CancelInterface()">
			</form>
		</div>
	</div>

	<!--教师信息查看界面-->
	<div class="checkInterface" id="checkinter">
		<div class="interface-top">		
			查看教师信息
		</div>

		<div class="interface-middle">
			<from id="interface-from" action="submit">
				ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="checkid" type="text"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="checkname" type="text"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="checksex" type="text"><br><br>
				Birthday&nbsp&nbsp<input id="checkbirthday" type="text"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="checksalary" type="text"><br><br>
				College&nbsp&nbsp&nbsp<input id="checkcollege" type="text"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="checkmajor" type="text"><br><br>
			</from>
		</div>

		<div class="interface-bottom">
			<form id="after-from">
				<input class="ensureButton" type="button" value="确定" 
				onclick="CancelInterface()">
			</form>
		</div>
	</div>

	<!--教师信息修改界面-->
	<div class="amendInterface" id="amendinter">
		<div class="interface-top">		
			修改教师信息
		</div>

		<div class="interface-middle">
			<from id="interface-from" action="submit">
				ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="amendid" type="text"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="amendname" type="text"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="amendsex" type="text"><br><br>
				Birthday&nbsp&nbsp<input id="amendbirthday" type="text"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="amendsalary" type="text"><br><br>
				College&nbsp&nbsp&nbsp<input id="amendcollege" type="text"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input id="amendmajor" type="text"><br><br>
			</from>
		</div>

		<div class="interface-bottom">
			<form id="after-from">
				<input class="saveButton" type="button" value="保存" 
				onclick="amendjudgevalue()">
				<input class="CancelButton" type="button" value="取消"
				onclick="CancelInterface()">
			</form>
		</div>
	</div>
</body>
</html>