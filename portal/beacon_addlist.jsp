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
	if(document.frm1.beaconID.value == 0 ||document.frm1.beaconName.value== 0 || document.frm1.installID.value.length == 0)
		alert("내용이 다 입력되지 않았습니다. 확인 바랍니다.");
	else {
		document.frm1.submit();
	}		
}
</script>

</head>
<body>
<form name=frm1 method=post action="control_data.jsp">
<br>
<br><center><h2><font>비콘정보 추가하기</font></h2></center>
<br>
 <input type=hidden name="action" value="b_insert">
<table class='table table-bordered' align = center border=1 cellspacing=0 cellpadding=5>

<%--비콘 아이디 --%>
<tr><th>비콘 아이디</th>
	<td><input type=text name=beaconID size=25 placeholder="비콘ID"></td></tr>
	
<%--비콘 이름 --%>
<tr><th>비콘 이름</th>
 <td><input type=text name=beaconName size=25 placeholder="비콘이름"></td></tr>

<%--설치장소 id --%>
<tr><th>설치장소 id</th>
 <td><input type=text name=installID size=25 placeholder="설치장소 ID"></td></tr>
<%--설치장소 id --%>
<tr><th>설치장소 name</th>
 <td><input type=text name=installName size=25 placeholder="설치장소 이름"></td></tr>

<%--2가지 버튼 포맷(추가, 취소) --%>
<tr align = center >
	<th colspan=2 >
		<center>
		<input type=button class="btn btn-info" value="추가" width=20 onclick="check()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=reset class="btn btn-info" value="취소" onClick="document.location='control_data.jsp?action=b_list'">
		</center> 
	</th>
</tr>
</table>
</form>
</body>