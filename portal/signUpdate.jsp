<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="signup.*, java.util.*" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="signupdto" class="signup.SignupDTO" scope="request"/>
<jsp:setProperty property="*" name="signupdto"/>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/signup_add.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>Team_DID Portal SignUp</title>

<script type="text/javascript">
	function check() {
		String action = request.getParameter("action");
	if(action=="update"){
		window.location="index.html";
		
	}
	else {
		
		document.confirmInfo.submit();
	}		
}
</script>
</head><body>
<%	boolean admin =(Boolean)session.getAttribute("admin");// admin 관리자이면 true
%>
<center><b><font size="8" color="blue">회원가입 정보를 확인하세요</font></b></center>
<br><br>
<center>
<% if(admin) {%>
<form name="confirmInfo" action="index.html" method="post">
<b><font size="5"> <%=signupdto.getName()%> </font>님의 회원 정보입니다. </b><br><br>

<table style="width:800px;" class='table table-bordered' bordercolor="skyblue">
<tr> <th> 사용자 id </th> <td><%=signupdto.getId()%> </td></tr>
<tr> <th> 비밀번호 </th><td><%=signupdto.getPasswd()%></td></tr> 
<tr><th> 이메일 </th><td> <%=signupdto.getMail()%></td></tr>
</table>
<input class="btn btn-info" type="submit" value="확인" onclick="check()">
</form>
<%}else{ %>
<form name="confirmInfo" action="storeHome.jsp" method="post">
<b><font size="5">음식점 <%=signupdto.getName()%></font>님의 회원 정보입니다. </b><br><br>

<table style="width:800px;" class='table table-bordered' bordercolor="skyblue">
<tr> <th> 사용자 id </th> <td><%=signupdto.getId()%> </td></tr>
<tr> <th> 비밀번호 </th><td><%=signupdto.getPasswd()%></td></tr> 
<tr><th> 이메일 </th><td> <%=signupdto.getMail()%></td></tr>
</table>
<input class="btn btn-info" type="submit" value="확인" onclick="check()">
 </form>
<%} %>
</center>
 
</body>
</html>