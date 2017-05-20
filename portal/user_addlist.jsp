<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>add list</title>
<link rel="stylesheet" href="CSS/addlist.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 내용이 다 채워진 건지 확인 -->
<script type="text/javascript">
function check() {
	if(document.frm1.userID.value == 0 || document.frm1.userPasswd.value== 0 || document.frm1.userName.value.length == 0 || document.frm1.userMail.value.length == 0 || document.frm1.ANDROID_ID.value.length == 0)
		alert("내용이 다 입력되지 않았습니다. 확인 바랍니다.");
	else {
		document.frm1.submit();
	}		
}
</script>

</head>
<body>
<form class="col-lg-10" name=frm1 method=post action="control_data.jsp">
<br>
<br><center><h2><font>고객정보 추가</font></h2></center>
<br>
 <input type=hidden name="action" value="u_insert">

<table class='table table-bordered' align =center border=1 cellspacing=0 cellpadding=5>

<%--사용자 아이디 --%>

<tr><th>사용자 아이디</th>
<td><div class="col-lg-10"><input type=text name=userID size="50" placeholder="ID"></div></td>
</tr>

<%--사용자 Passward --%>
<tr>
<th>사용자 password</th>
<td><div class="col-lg-10"><input type=password name=userPasswd size="50" placeholder="password"></div></td></tr>

<%--사용자 이름 --%>
<tr>
<th>사용자 이름</th>
 <td><div class="col-lg-10"><input type=text name=userName size="50" placeholder="name"></div></td></tr>
<%--사용자 이메일 --%>
<tr>
<th>사용자 이메일</th>
 <td><div class="col-lg-10"><input type=text name=userMail size="50" placeholder="E-Mail"></div></td></tr>
 
 
<%--사용자 MAC주소 --%>
<tr>
<th>ANDROID_ID</th>
<td><div class="col-lg-10"><input type=text name=ANDROID_ID size="50" placeholder="ANDROID_ID"></div></td></tr>

<%--연령대 --%>
<tr>
<th>연령대</th>
<td><div class="col-lg-10"><input type=text name=userAgesection size="50" placeholder="연령대"></div></td></tr>

<%-- 흥미 --%>
<tr>
<th>흥미</th>
<td><div class="col-lg-10"><input type=text name=userInteresting size="50" placeholder="흥미"></div></td></tr>


<%--2가지 버튼 포맷(추가, 취소) --%>

<tr>
	<th colspan=2 >
	<center>
		<input class="btn btn-info" type=button value="추가" width=20 onclick="check()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="btn btn-info" type=reset value="취소" onClick="document.location='control_data.jsp?action=u_list'"> 
	</center>
	</th>
</tr>

</table>

</form>
</body>