<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="edu.cqut.hr.service.TeacherService,edu.cqut.hr.model.Teacher,edu.cqut.hr.dao.TeacherDao" %>
<% 
        String path = request.getContextPath(); 
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
        String name = request.getParameter("name");//用request得到 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<title>教师管理系统</title>
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
		
		<% 
		TeacherService teacherService = new TeacherDao();
		List<Teacher>  Teachers = teacherService.queryAll();
		
		for(int i = 0; i < Teachers.size(); i ++){%>
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
	
	//翻页
	function page(){

		var tab = document.getElementById("tab");

		var count = (counts-1)*10;

		for(var num = 1;num < 11 ; num ++){
			var teacher= teachers[num+count-1];
			if(num + count < teachers.length+1){
				tab.rows[num].cells[0].innerHTML=num+count;
				tab.rows[num].cells[1].innerHTML=teacher.id;
				tab.rows[num].cells[2].innerHTML=teacher.name;
				tab.rows[num].cells[3].innerHTML=teacher.sex;
				tab.rows[num].cells[4].innerHTML=teacher.birthday;
				tab.rows[num].cells[5].innerHTML=teacher.salary;
				tab.rows[num].cells[6].innerHTML=teacher.college;
				tab.rows[num].cells[7].innerHTML=teacher.major;	
				tab.rows[num].cells[8].innerHTML="<img src='img/查看.png'/>";			
				tab.rows[num].cells[9].innerHTML="<img src='img/修改.png'/>";
				tab.rows[num].cells[10].innerHTML="<a href='TeacherAction?type=delete&&deleteid="+teacher.id+"'><img src='img/删除.png'/></a>";
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

			}
			displaypage();
		}
	}
	
	
	
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
	
		displaypage();
	}

	//增加信息  要

	function addInterface(){

		var t1 =document.getElementById("inter");
		t1.style.display='block';

		var t2 =document.getElementById("addinter");
		t2.style.display='block';

	}
 
	// 要
	function deleteEnsure(){
		if(confirm("您确定要删除吗？"))
		deleteElement();
		else
		CancelInterface();
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

	function updateAction() {
		document.updatename.action = "TeacherAction?type=update";
		document.updatename.submit();
	} 
	
	function addAction() {
		document.addname.action = "TeacherAction?type=add";
		document.addname.submit();
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
				<form name="deletemanyname" method= "post">	
					<input class="addButton" type="button" value="新增" onclick="addInterface()">
				</form>
			</div>
		</div>
		<div class="content">
		<form name = "deleteonename" method = "post">
			<table class="tab" id="tab">
				<tr class="backGroundColor1">
					<th>序号</th><th>ID</th><th>Sex</th><th>Name</th>
					<th>Birthday</th><th>salary</th><th>College</th><th>major</th>
					<th colspan="3">操作</th>
				</tr>
				
				<% for(int n = 0; n < 10 ; n++) {%>
				<tr class="backGroundColor<%=n%2%>">
					<td></td><td></td><td></td><td></td>
					<td></td><td></td><td></td><td></td>
					<td class="operator1" onclick="checkInterface(<%= n+1 %>)"></td>
					<td class="operator2" onclick="amendInterface(<%= n+1 %>)"></td>
					<td class="operator3" "></td>
				</tr>
				<% }%>
			</table>
		</form>
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

        <form name="addname" method="post">
		<div id="interface-from2" class="interface-middle">
				&nbspID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="id" id="addid" type="text" placeholder="请输入ID"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="name" id="addname" type="text" placeholder="请输入姓名"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="sex" id="addsex" type="text" placeholder="请输入性别"><br><br>
				Birthday&nbsp&nbsp<input name="birthday" id="addbirthday" type="text" placeholder="请输入生日"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="salary" id="addsalary" type="text" placeholder="请输入薪水"><br><br>
				College&nbsp&nbsp&nbsp<input name="college" id="addcollege" type="text" placeholder="请输入学院"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="major" id="addmajor" type="text" placeholder="请输入专业"><br><br>
		</div>

		<div class="interface-bottom2" id="after-from">
				<input class="submitButton" type="button" value="提交" 
				onclick="addAction()">
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
				ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="id" id="checkid" type="text"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="name" id="checkname" type="text"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="sex" id="checksex" type="text"><br><br>
				Birthday&nbsp&nbsp<input name="birthday" id="checkbirthday" type="text"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="salary" id="checksalary" type="text"><br><br>
				College&nbsp&nbsp&nbsp<input name="college" id="checkcollege" type="text"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="major" id="checkmajor" type="text"><br><br>
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

        <form  name = "updatename" method="post">
		<div class="interface-middle" id="interface-from2">
				ID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name = "id" id="amendid" type="text" readonly="readonly"><br><br>
				Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name = "name" id="amendname" type="text"><br><br>
				Sex&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name = "sex" id="amendsex" type="text"><br><br>
				Birthday&nbsp&nbsp<input name = "birthday" id="amendbirthday" type="text"><br><br>
				Salary&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name = "salary" id="amendsalary" type="text"><br><br>
				College&nbsp&nbsp&nbsp<input name = "college" id="amendcollege" type="text"><br><br>
				Major&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name = "major" id="amendmajor" type="text"><br><br>
		</div>
		<div class="interface-bottom2" id="after-from">
			
				<input class="saveButton" type="button" value="保存" 
				onclick="updateAction()">
				<input class="CancelButton" type="button" value="取消"
				onclick="CancelInterface()">
		</div>
		</form>
	</div>
</body>
</html>