<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="signup.*, java.util.*" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<jsp:useBean id="dao" class="signup.SignupDAO" />
<jsp:useBean id="signupdto" class="signup.SignupDTO"/>
<jsp:setProperty property="*" name="signupdto"/>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<head>
<link rel="stylesheet" href="CSS/signup_add.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>
	<center><b><font size="8" color="blue">회원 정보 수정</font></b></center>
	<br><br>
	<%
	 	ArrayList<SignupDTO> sdto = (ArrayList<SignupDTO>)datas;
		
		String sessionId = (String)session.getAttribute("sessionId");
		boolean admin = (Boolean)session.getAttribute("admin");
		
		SignupDTO dto = dao.getDB(sessionId);
	%>
	<center>
	<form name="editInfo" method="post" action="control_login.jsp?action=update">
	<b><font size="5"> <%=dto.getName()%> </font>님의 회원 정보입니다. </b><br><br>
	
	<table style="width:800px;" class='table table-bordered' bordercolor="skyblue">
	<tr> <th> 사용자 id </th> <td><%=dto.getId()%><input type="hidden" name="id" value=<%=dto.getId()%>> </td></tr>
	<tr> <th> 비밀번호 </th><td><input type="text" name="passwd" value=<%= dto.getPasswd() %>></td></tr>
	<tr> <th> 사용자 이름 </th><td><input type="text" name="name" value=<%= dto.getName() %>></td></tr>
	<tr><th> 이메일 </th><td><input type="text" name="mail" value=<%= dto.getMail() %>></td></tr>
	</table>
	<% if(admin) { %>
		<input class="btn btn-info" type="reset" value="취소" onClick="javascript:window.location='index.html'"> <input type="submit" value="확인">
	<% }else{ %>
	
	<input class="btn btn-info" type="reset" value="취소" onClick="javascript:window.location='storeHome.jsp'"> <input type="submit" value="확인">
	
	<% }
	%>
	 
	 </form>
	 </center>
</body>
</html>