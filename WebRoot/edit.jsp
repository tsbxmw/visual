<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String result = (String)request.getAttribute("result");
String result1 = (String)request.getAttribute("result1");
if(result==null)
	result="Welcom";
if(result1==null)
	result1="Welcom";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css" media="screen">  
		body { padding: 20px; font-size: 0.85em; font-family: georgia, serif; }  
		.btn { display: block; position: relative; background: #aaa; padding: 5px; float: center; color: #fff; text-decoration: none; cursor: pointer; }  
		.btn * { font-style: normal; background-image: url(btn2.png); background-repeat: no-repeat; display: block; position: relative; }  
		.btn i { background-position: top left; position: absolute; margin-bottom: -5px;  top: 0; left: 0; width: 5px; height: 5px; }  
		.btn span { background-position: bottom left; left: -5px; padding: 0 0 5px 10px; margin-bottom: -5px; }  
		.btn span i { background-position: bottom right; margin-bottom: 0; position: absolute; left: 100%; width: 10px; height: 100%; top: 0; }  
		.btn span span { background-position: top right; position: absolute; right: -10px; margin-left: 10px; top: -5px; height: 0; }  
		* html .btn span,  
		* html .btn i { float: left; width: auto; background-image: none; cursor: pointer; }  
		.btn.blue { background: #2ae; }  
		.btn.green { background: #9d4; }  
		.btn.pink { background: #e1a; }  
		.btn:hover { background-color: #a00; }  
		.btn:active { background-color: #444; }  
		.btn[class] {  background-image: url(shade.png); background-position: bottom; }  
		* html .btn { border: 3px double #aaa; }  
		* html .btn.blue { border-color: #2ae; }  
		* html .btn.green { border-color: #9d4; }  
		* html .btn.pink { border-color: #e1a; }  
		* html .btn:hover { border-color: #a00; }  
		p { clear: both; padding-bottom: 2em; }  
		form { margin-top: 2em; }  
		form p .btn { margin-right: 1em; }  
		textarea { margin: 1em 0;}  
	</style>


  </head>
  
  <body style="background:#87CEFA">
   
  <center>
<div>
<h1>用户管理</h1>

<form action="ManageServlet" method="post" style=" border:1px solid #006600">
	<table>
	<tr>
	<th width="66" align="right"><font size="3">姓名</font></td>
	<td colspan="2"><input type="text" name="username"  placeholder="姓名" style="width:200;height:25;"/></td>
	</tr>
	<tr>
	<td width="66" align="right"><font size="3">邮箱</font></td><td colspan="2"><input type="text" name="email"  placeholder="example@zte.com.cn" style="width:200;height:25;"/></td>
	</tr>
	<tr>
	<td width="66" align="right"><font size="3">工号</font></td><td colspan="2"><input type="text" name="user_id" placeholder="8位工号" style="width:200;height:25;"/></td>
	</tr>
	<tr>
	<td width="66" align="right">性别</td>
	<td width="66" align="right">
	<!--<td width="66" align="right"><font size="3">性别</font></td><td colspan="2"><input type="text" name="sex"  style="width:200;height:25;"/></td>-->
	男 <input name="sex" type="radio" value="1" checked/></td>
	<td  colspan="2" width="66">女 <input name="sex" type="radio"  value="0"/>
	<td width="66" align="right">
	</tr>
	
	
	<tr>
	<!-- <td width="66" align="right"><font size="3">科室</font></td><td colspan="2"><input type="text" name="team"  style="width:200;height:25;"/></td> -->
	<td width="66" align="right"><font size="3">科室</font></td>
	<td width="100"  >
	<select id="team" name="team" width="100" >
		<option value ="sh_shiyan">---上海实验科---</option>  
 		<option value ="nj_shiyan">---南京实验科---</option>  
  		<option value="sh_chanpin">---上海产品科---</option>  
 		<option value="nj_chanpin">---南京产品科---</option>  
	</select></td>
	</tr>
	
	<tr>
	<input type="text" id="flag" name="flag" value="query" style="visibility: hidden"> 
	<td colspan="3" align="center" ><button width="200px" id="addnewuser" onclick="addNewUser()" class="btn green">添加 </button></td>
	</tr>
	<tr>
	<td colspan="3" align="center" > Result:<%=result %></td> 

	</tr>
	<tr>
	<td colspan="3" align="center">-----------------------------------</td>
	</tr>

	<tr>
	<td width="66" align="right"><font size="3">工号</font></td><td colspan="2"><input type="text" name="username_rm" placeholder="8位工号" style="width:200;height:25;"/></td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	<button id="removeuser" onclick="removeUser()" width="100px" class="btn blue">移除</button>
	</td>
	</tr>
	<tr>
	<td colspan="3" align="center"> Result:<%=result1 %></td>
	
	</tr>
	<tr>
	<td colspan="3" align="center">-----------------------------------</td>
	</tr>
	<tr>
	<td colspan="3" align="center">
	
	<input type="button" id="quit" value="退出" onclick="if(confirm('是否退出?')) location.replace('./main.jsp');" class="btn pink">
	
	</td></tr>
	</table>
	</form>
	<div>
	<tr>
	<td  colspan="3" align="center">
	
	 </td>
	 </tr>
	</div> 
</div>
</center>

 <script type="text/javascript">
    function addNewUser() {
        document.getElementById("flag").value="addNewUser";
        var selected_val = document.getElementsByname("team");
        alert(selected_val.value);
        var rds=document.getElementsByname("sex");
        var rdval;
        for(var i=0;i<rds.length;i++){
        	if(rds.item(i).checked){
        		rdval=rds.item(i).getAttribute("value");
        		alert(rdval);
        	}
        }
        
        document.forms[0].submit();
    }
    function removeUser() {
        document.getElementById("flag").value="removeUser";
        document.forms[0].submit();
    }
    function Quit() {
        document.getElementById("flag").value="quit";
        if(confirm("是否退出？")){
        	location.reload("main.jsp");
        }
    }
</script>
  </body>
 
</html>
