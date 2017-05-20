<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="BeaconError.jsp"
    pageEncoding="UTF-8" import="store.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- orderlist 관련 useBean --%>

<jsp:useBean id="o_dto" class="store.orderDTO" />
<jsp:setProperty name="o_dto" property="*"/>
<% 
o_dto = (orderDTO)request.getAttribute("datas");
//String signal = (String)session.getAttribute("signal");

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/signup_add.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script language="javascript">
 function checkConfirm(){
	 document.frm1.submit();
 }
</script>
</head>
<body>
<br><br><br>
<center>
<form name="check" action="control_data.jsp">
<div class='table-responsive'>
<table style='width:650px;' class='table table-bordered' border='1' cellspacing=0 align=center>
<tr><th colspan="2" height="250px" style="font-size:25pt">
<center><br><br>
<%=o_dto.getUserName() %>님이  &nbsp;&nbsp;&nbsp; <%=o_dto.getProductName() %>을 <br><br>
[ <%=o_dto.getProductAmount()%> ] 만큼 주문 하였습니다.<br><br>
확인해주세요!<input type="hidden" name="signal" value="<%=o_dto.getOrderID() %>"><br><br><br>
</center></th></tr>
<tr><th><center><input class="btn btn-success" type="submit" value="확인"><input type="hidden" name="action" value="approval_true"></center></th>
</tr>
</table>
</div>
</form>
</center>
</body>
</html>