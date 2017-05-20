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
	if(document.frm1.payCatagoryID.value == 0 ||document.frm1.payCatagoryName.value== 0)
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
<br><center><h2><font>결제 분류 정보 추가하기</font></h2></center>
<br>
 <input type=hidden name="action" value="pc_insert">
<table align = center border=1 cellspacing=0 cellpadding=5>

<%--결제 분류아이디 --%>
<tr><th style="text-align:center;">결제분류<br> 아이디</th>
	<td style="text-align:center;"> <input type=text name=payCatagoryID size=25 placeholder="결제분류 ID"></td></tr>

<%--결제 분류 이름 --%>
<tr ><th style="text-align:center;">결제분류 이름</th>
 <td style="text-align:center;"> <input type=text name=payCatagoryName size= 25 placeholder="결제분류 이름"></td></tr>

<%--2가지 버튼 포맷(추가, 취소) --%>
<tr align = center >
	<th colspan=2 >
		<center>
		<input type=button class="btn btn-info" value="추가" width=20 onclick="check()">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=reset class="btn btn-info" value="취소" onClick="document.location='control_data.jsp?action=pc_list'">
		</center> 
	</th>
</tr>
</table>
</form>
</body>