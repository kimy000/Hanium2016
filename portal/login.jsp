<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Team_DID Portal Login </title>

<%
	if(session.getAttribute("sessionId") == null){
		//null 로그인 안되었을때
%>

<script language="javascript">
	function focusIt(){
		document.inform.id.focus();
	}
	
	//id 또는 pwd가 입력되지 않은 경우 알림 메시지 출력
	function checkIt(){
		inputForm=eval("document.inform");
		
		if(!inputForm.id.value){
			alert("ID가 입력되지 않았습니다.");
			inputForm.id.focus();
			
			return false;
		}
		
		if(!inputForm.pwd.value){
			alert("비밀번호가 입력되지 않았습니다.");
			inputForm.pwd.focus();
			
			return false;
		}
	}
	
	//회원 정보 수정과 회원 탈퇴 연결 스크립트
	function connectPage(mode){
		if(mode == "edit")
			logined.action="updated_manager.jsp?";
		
		else if(mode == "delete")
			logined.action="control_login.jsp?";
			
	}
	//회원가입 시 음식점 주인인지 관리자인지 구분하는 스크립트
	function checkAdmin(){
		result = prompt("관리자 아이디를 생성하려면 비밀번호를 입력하세요.");
		
		if(result == "admindd")
			window.location="signup.jsp";
		else
			window.location="signup_store.jsp";
	}
</script>

</head>
<body onload="focusIt()">
<!--  action="loginPro.jsp" 
 -->	<form name="login" method="post" action="control_login.jsp?">
		<table align="center" border="1" cellpadding="4" cellspacing="0">
			<tr align="center">
				<th width="50" style="text-align:center;"> <label for="id"> ID </label> </td>
				<td width="100" style="text-align:center;"> <input type="text" name="id"> <input type="hidden" name="action" value="login"></td>
			</tr>
			<tr align="center">
				<th width="50" style="text-align:center;"> <label for="passwd"> PWD </label> </td>
				<td width="100" style="text-align:center;"> <input type="password" name="passwd"> </td>
			</tr>
			<tr align="center">
				<th colspan="2">
				<center>
				<input class="btn btn-success" type="submit" value="Log In">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-success" type="button" value="SignUp" onclick="checkAdmin()"></center></th>
				
		</tr>			
		</table>
	</form>
	
<% }else{ // 로그인시 
	if((Boolean)session.getAttribute("admin") == false){
%>
	<form name="logined" method="post" action="control_login.jsp?action=delete">
		<table align="center" border="1" cellpadding="4" cellspacing="0">
			<tr align="center">
				<th colspan="4" width="150" height="50" ><font color="red"> <%=session.getAttribute("sessionId") %> </font>님 로그인되었습니다. </th>
			</tr>
			<tr align="center">
				<td> <input type="button" class="btn btn-info" value="Home" onclick="javascript:window.location='storeHome.jsp'"> </td>
				<td> <input type="button" class="btn btn-info" value="Edit" onclick="javascript:window.location='update_manager.jsp'"> </td>
				<td> <input type="submit" class="btn btn-info"  value="Withdraw"> </td>
			</tr>
		</table>
	</form>
	<%}
	else{
		%>
 		<form name="logined" method="post" action="control_login.jsp?action=delete">
		<table align="center" border="1" cellpadding="4" cellspacing="0">
			<tr align="center">
				<td colspan="4" width="150" height="50"><font color="blue"> <%=session.getAttribute("sessionId") %> </font>님 로그인되었습니다. </td>
			</tr>
			<tr align="center">
				<td> <input type="button" class="btn btn-success" value="Home" onclick="javascript:window.location='index.html'"> </td>
				<td> <input type="button" class="btn btn-success" value="Edit" onclick="javascript:window.location='update_manager.jsp'"> </td>
				<td> <input type="submit" class="btn btn-success" value="Withdraw"> </td>
			</tr>
		</table>
	</form>
<%}
	}
	//음식점 가게 주인일 시 보여줘야하는 페이지로 넘겨주는 것
%>
</body>
</html>
<% //수정 필요하아아아ㅏㅇㅁ%>