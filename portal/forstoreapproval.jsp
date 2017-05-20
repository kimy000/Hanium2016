<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name = "frm_approvalconfirm" action="control_data.jsp">
	<input type="hidden" name ="action" value="approval">
	
	</form>
	<script>document.frm_approvalconfirm.submit();</script>
</body>
</html>