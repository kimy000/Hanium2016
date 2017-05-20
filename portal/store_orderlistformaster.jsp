<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,store.*" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- app_contnet.jsp에서 사용하기 위한 객체 준비 --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<link rel="stylesheet" href="CSS/menu.css" type="text/css" media="screen"/>
<style>a:visited{color:#2ED283; text-decoration:none;}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>store-content</title>
</head>

<body>

<table>
	<tr>
	<td align="right"><a href="store_approval.jsp" target="_self"><img src="image/orderApproval.png" width="15%" alt="주문승인" title="주문승인"/></a>
	</td>
	<td></td><td></td>
	<td align="left"><a href="store_orderlistformaster.jsp" target="_self"><img src="image/orderList.png" width="15%" alt="주문내역조회"/></a></td>
	</tr>
	<tr>
	<td align="right"><font style="color:#189E42;text-align:center;font-size:7px;">주문 승인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
	<td>&nbsp;&nbsp;</td>
	<td>&nbsp;&nbsp;</td>
	<td align="left"><font style="color:#189E42;text-align:center;font-size:7px;">&nbsp;&nbsp;&nbsp;주문내역 조회</font></td>
	</tr></table>
	
<form name = "frm_store_order">
<%
	ArrayList<orderDTO> orderList = (ArrayList<orderDTO>)datas;
	
	// index를 부여하여 해당 페이지에서 10개의 항목만 출력하도록 함
	int count = orderList.size();
	int size; 

	if(count % 10 == 0)
		size = count / 10;
	else
		size = count / 10 + 1;

	int index;
	if(request.getParameter("index") == null) {
		index = 0;
	}
	else{
		index = Integer.parseInt(request.getParameter("index"));
		}

	int start = index * 10;
	int end;
	
	if(start + 10 <= count)
		end = start + 10;
	else
		end = start + (count % 10);

	
	// 값 조회시 보여주는 리스트_음식점 리스트
	out.println("<center><h2><a href='control_data.jsp?action=o_list_master'>[주문내역 보기]</a></h2></center><br>");
	
		
		out.println("<div class='table-responsive'> <table style='width:800px;margin-left: auto; margin-right: auto; text-align:center;' class='table table-bordered' border='1'  cellspacing=0 align=center>");
		
		out.println("<tr><th style='color:#189E42;text-align:center;'>번호</th><th style='color:#189E42;text-align:center;'>주문 번호</th><th style='color:#189E42;text-align:center;'>상품 이름</th><th style='color:#189E42;text-align:center;'>상품 수량</th><th style='color:#189E42;text-align:center;'>구매자 이름</th><th style='color:#189E42;text-align:center;'>결제승인여부</th></tr>");
		
		for (int j = start; j < end; j++) {
			orderDTO list = orderList.get(j);
			int tp = j+1;
			out.println("<tr align = center>");
			out.println("<td>" + tp + "</td>");
			out.println("<td>&nbsp;"+list.getOrderID()+"</td>");
			out.println("<td>" + list.getProductName()+ "</td>");
			out.println("<td>" + list.getProductAmount() + "</td>");
			out.println("<td>" + list.getUserName()+ "</td>");
			out.println("<td>" + list.getPayConfirm()+ "</td>");
			out.println("</tr>");
		}
		out.println("</table></div>");
		// 전체 리스트로 이동
	
		out.println("<p><center>");
		
		
		// index 보여주기
		for (int k = 1; k <= size; k++) {
			if (k == (index + 1)){
			
				out.println("&nbsp;&nbsp;" + k);
			}
				
			else
				out.println("&nbsp;<a href=\"control_data.jsp?action=o_list_master&index=" + (k - 1) + "\">&nbsp;" + k
						+ "</a>&nbsp;");
			if (k == size){
				out.println("</center></p><br>");
			}
		}	
%>
</form>

<% request.setAttribute("datas", datas);%>
</body>
</html>