<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,payInfo.*" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- paymg_contnet.jsp에서 사용하기 위한 객체 준비 --%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<link rel="stylesheet" href="CSS/menu.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="CSS/sublist.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>paySection-content</title>
</head>

<body>
<aside id="left">
<ul>
<li><a href="payPlist_content.jsp" target="_self">상품 결제 내역</a></li>
<br>
<li><a href="payTlist_content.jsp" target="_self">티켓 결제 내역</a></li>
<br>
<li><a href="paymg_content.jsp" target="_self">결제 분류 관리</a></li>
</ul>
</aside>
<form name = "frm_paymanagement">
<%
	ArrayList<payCDTO> payCList = (ArrayList<payCDTO>)datas;

	// index를 부여하여 해당 페이지에서 10개의 항목만 출력하도록 함
	int count = payCList.size();
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

	
	// 값 조회시 보여주는 리스트
	out.println("<center><h2><a href='control_data.jsp?action=pc_list'>[전체 목록 보기]</a></h2></center>");
		// index 보여주기
				String payCatagoryID = (String) request.getAttribute("payCatagoryID");
				out.println("<center> ");
				for (int k = 1; k <= size; k++) {
					
					if (k == (index + 1)){
						
						out.println("&nbsp;&nbsp;" + k +"&nbsp;&nbsp;" );
						
					}
						
					else{
						if(k%10 == 1){
							out.println("<Br>");
						}
						out.println("<a href=\"control_data.jsp?action=pc_list&index=" + (k-1)+ "&payCatagoryID="
								+ payCatagoryID + "\">&nbsp;" + k + "</a>&nbsp;");
						
					}
					if (k == size){
						out.println("</center>"+"<br>");
					}
				
				}
				

				payCDTO list;
				out.println("<div class='table-responsive'> ");
				out.println("<table style='width:800px;' class='table table-bordered table-hover' border='1' cellspacing=0 align=center>");

				out.println("<tr><th style='text-align:center;'>번호</th><th style='text-align:center;'>결제 분류 id</th><th style='text-align:center;'>결제 분류 이름</th></tr>");
				for (int j = start; j < end; j++) {
					list = payCList.get(j);
					int tp = j+1;
					out.println("<tr align = center>");
					out.println("<td style='width:25px;'>" + tp + "</td>");
					out.println("<td><a href=\"control_data.jsp?action=pc_delete&payCatagoryID="+ list.getPayCatagoryID() + "\">&nbsp;"+list.getPayCatagoryID()+"</a></td>");
					out.println("<td>" + list.getPayCatagoryName() + "</td>");
					out.println("</tr>");	
					
				}
				out.println("</table></div>");
%>
</form>
<br>
<br>
<br>
<form action="paymg_addlist.jsp" method="post">
<center>
<input class="btn btn-info" type="submit" value="ADD">
</center>
</form>
<% request.setAttribute("datas", datas);%>
</body>
</html>