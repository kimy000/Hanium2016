<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "user.*, java.util.*" errorPage="BeaconError.jsp"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="CSS/editlist.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!--  UserDTO 객체 값 가져오기 -->
<jsp:useBean id="udto" scope="request" class="user.UserDTO" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 페이지</title>

<!-- 삭제 확인 -->
<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.frm1.action.value="u_delete";
			document.frm1.submit();
		}
		else
			return;
	}
</script>
</head>
<body>
<% UserDTO userdto = (UserDTO)udto; %>
<br>
<br><center><h2><font>사용자  정보 수정</font></h2></center>
<br>
<form name=frm1 method=post action="control_data.jsp">

<%-- hidden을 통해 parameter값 넘겨주기 --%>
<input type=hidden name="userID" value="<%= udto.getUserID()%>">
<input type=hidden name="action" value="u_update">

<table class='table table-bordered' border=1 cellspacing=0 cellpadding=5>
<%--사용자 아이디 --%>
<tr><th>사용자 아이디</th>
<td><input type=text name=userID size=30 value="<%=udto.getUserID()%>" readonly="readonly"></td></tr>
<%--사용자 password --%>
<tr><th>사용자 password</th>
<td><input type=password name=userPasswd size=30 value="<%=udto.getUserPasswd()%>" placeholder="password"></td></tr>

<%--사용자 이름 --%>
<tr><th>사용자 이름</th>
<td><input type=text name=userName size=30 value="<%=udto.getUserName()%>" placeholder="Name"></td></tr>

<%--사용자 Email --%>
<tr><th>사용자 E-Mail</th>
 <td><input type=text name=userMail size=30 value="<%=udto.getUserMail()%>" placeholder="E-Mail"></td></tr>

<%--사용자 MAC 주소 --%>
<tr><th>사용자 ANDROID_ID 주소</th>
 <td><input type=text name=ANDROID_ID size=30 value="<%=udto.getANDROID_ID()%>" placeholder="ANDROID_ID"></td></tr>
	
<%--연령대 --%>
<tr><th>연령대</th>
 <td><input type=text name=userAgesection size=30 value="<%=udto.getUserAgesection()%>" placeholder="연령대"></td></tr>

<%-- 흥미 --%>
<tr><th>흥미</th>
 <td><input type=text name=userInteresting size=30 value="<%=udto.getUserInteresting()%>" placeholder="흥미"></td></tr>

<%-- 수정, 삭제, 취소 동작 --%>
<tr>
	<th colspan=2>
	<center><input class="btn btn-info" type=submit value="수정">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="btn btn-info" type=button value="삭제" onClick="delcheck()">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="btn btn-info" type=button value="취소" onClick="document.location='control_data.jsp?action=u_list'">
	</center>
	</th></tr>
</table>
</form>
</body>
</html>