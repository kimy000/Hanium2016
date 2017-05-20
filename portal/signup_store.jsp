<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="signup.SignupDAO" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/signup_add.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<title>Team_DID Portal Sign Up</title>

<script type="text/javascript">
	function check() {
	if(document.frm1.id.value == 0){
		alert("아이디가 입력되지 않았습니다. ");
		return;
	}
		
	if(!document.frm1.passwd.value){
		alert("비밀번호를 입력하세요.");
		return;
	}
	
	if(document.frm1.passwd.value != document.frm1.passwd2.value){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	
	if(!document.frm1.name.value){
		alert("사용자 이름을 입력하세요.");
		return;
	}
	if(!document.frm1.mail1.value && !document.frm1.mail2.value){
		alert("이메일을 입력하세요.");
		return;
	}
	else {
		
		document.frm1.submit();
	}		
}
	function openConfirmid(inputid){
		if(inputid.id.value == ""){
			alert("값이 입력되지 않았습니다.");
			return;
		}
		//url怨??ъ슜???낅젰 id瑜?議고빀
		url = "confirmid.jsp?id=" + inputid.id.value;
		//?덈줈???덈룄???닿린
		open(url, "confirm", "toolbar=no, location=no, status=no, scrollbar=no, resizable=no, width=300, height=180");
	}
</script>
</head>
<body>
<a href="intro.jsp"><img id="login" src="image/signin.png" align="right" width="3%"></a>
<center>
<h1 id="title"><font color="#870041">Team DID </font> Portal System </h1>
</center>
<br><Br><br>
<center>
<form name="frm1" method="post" action="control_login.jsp">
<table border="3" bordercolor="skyblue">
<tr><th>사용자 id</th><td><input type="text" name="id" size="10">
<input type="hidden" name="action" value="signup"> 
<input type="button" value="id 중복확인" onclick="openConfirmid(this.form)">
</td></tr>
<tr><th>비밀번호</th><td> <input type="password" name="passwd"></td></tr>
<tr><th>비밀번호 확인</th><td> <input type="password" name="passwd2"></td></tr>
<tr><th>사용자 이름</th><td> <input type="text" name="name"></td></tr>
<tr><th>이메일</th><td> <input type="text" name="mail1">
@<select name=mail2>
<option value="naver.com">naver.com</option>
<option value="nate.com">nate.com</option>
<option value="daum.net">daum.net</option>
<option value="gmail.com">gmail.com</option>
</select>
<tr><th>관리자 여부</th><td>관리자 <input type="radio" name="mgadmin" value="true" disabled>&nbsp; 음식점 주인<input type="radio" name="mgadmin" value="false" checked></td></tr>
<tr><th colspan="2">
<center>
<input type="button" class="btn btn-info" value="회원가입" onClick="check()">&nbsp; &nbsp; &nbsp;
<input type="reset" class="btn btn-info"  value="Cancle" onClick="document.location='intro.jsp'">
</center>
</th></tr>

</table>
</form>
</center>
</body>
</html>