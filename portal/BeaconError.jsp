<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<head>
<link rel="stylesheet" href="CSS/list.css" type="text/css" media="screen"/>
</head>
<body bgcolor="skyblue">
<div align="center">
<font color="white"><H2>에러가 발생했습니다!</H2></font>
<HR>
<br><br>
<table cellpadding=5 width=400>
<tr width=150 height=300 bgcolor="white" align="center"><td>
에러가 발생했습니다!<BR><BR>
<font color="red">서비스센터</font>에 문의해주세요!<BR><BR>
|| <font color="red">서비스센터</font> ||  TEL: 02) 000 - 0000 <BR><BR>
<HR>
오류 사항 : <%= exception%>
<HR>

</td>
</tr>
</table>
</div>
</body>
</HTML>