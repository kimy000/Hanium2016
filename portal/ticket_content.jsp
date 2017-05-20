<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,ticket.*" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- ticket_contnet.jsp에서 사용하기 위한 객체 준비 --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<link rel="stylesheet" href="CSS/menu.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="CSS/sublist.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ticket-content</title>
</head>

<body>

<form name = "frm_ticketlist">
<%
	ArrayList<ticketDTO> ticketList = (ArrayList<ticketDTO>)datas;
	
	// index를 부여하여 해당 페이지에서 10개의 항목만 출력하도록 함
	int count = ticketList.size();
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
	out.println("<center><h2><a href='control_data.jsp?action=t_list'>[주문내역 보기]</a></h2></center>");
	
		out.println("<center> ");
		// index 보여주기
		for (int k = 1; k <= size; k++) {
			if (k == (index + 1)){
			
				out.println("&nbsp;&nbsp;" + k);
			}
				
			else
				out.println("&nbsp;<a href=\"control_data.jsp?action=t_list&index=" + (k - 1) + "\">&nbsp;" + k
						+ "</a>&nbsp;");
			if (k == size){
				out.println("</center><br>");
			}
		}
		
		out.println("<div class='table-responsive'> <table style='width:800px;' class='table table-bordered table-hover' border='1' cellspacing=0 align=center>");
		
		out.println("<tr><th>번호</th><th>티켓예매 ID</th><th>티켓 일자</th><th>티켓이름</th><th>좌석위치 정보</th><th>경기장 정보</th></tr>");
		
		
		for (int j = start; j < end; j++) {
			ticketDTO list = ticketList.get(j);
			int tp = j+1;
			out.println("<tr align = center>");
			out.println("<td>" + tp + "</td>");
			out.println("<td>"+list.getTicketbookID()+"</td>");
			out.println("<td>" + list.getTicketDate()+ "</td>");
			out.println("<td>" + list.getTicketName() + "</td>");
			out.println("<td>" + list.getSeatlocation()+ "</td>");
			out.println("<td>" + list.getStadiumInfo()+ "</td>");
			out.println("</tr>");
		}
		out.println("</table></div>");
		// 전체 리스트로 이동
		
%>
</form>

<% request.setAttribute("datas", datas);%>
</body>
</html>