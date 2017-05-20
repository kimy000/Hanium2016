<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="signup.SignupDAO" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title> ID 중복확인 </title>
<jsp:useBean id="signupdao" class="signup.SignupDAO" />

<% request.setCharacterEncoding("UTF-8"); %>
<div border="1">
<%
	String id = request.getParameter("id");
	//SignupDAO signupdao = SignupDAO.getInstance();
	int check = signupdao.confirmID(id);
	
	if(check == 1){ %>
	<b><font color="red"><%=id%></font>는 이미 사용중인 아이디입니다.</b>
	
	<form name="checkForm" method="post" action="confirmid.jsp">
		<b>다른 아이디를 선택하세요.</b><br><br>
		<input type="text" name = "id">
		<input type="submit" value="ID 중복 확인">
	</form>
<%

	} else{
%>
<center>
	<b> 입력하신 <font color="red"><%=id %></font>는 <br>
	    사용하실 수 있는 ID 입니다.</b><br><br>
	
	<input type="button" value="닫기" onClick="setid()">
</center>
<% } %>
</div>
<script language="javascript">
	function setid(){
		opener.document.frm1.id.value="<%=id%>";
		window.open('about:blank','_self').close(); //팝업창 닫기
	}
</script>