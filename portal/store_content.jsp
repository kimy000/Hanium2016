<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,store.*" errorPage="BeaconError.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- app_contnet.jsp에서 사용하기 위한 객체 준비 --%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="CSS/menu.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="CSS/sublist.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>store-content</title>
</head>

<body>
<aside id="left">
<ul>
<li><a href="store_content.jsp" target="_self">음식점 조회</a></li><br>
<li><a href="store_orderlist.jsp" target="_self">주문 내역 조회</a></li><br>
</ul>
</aside>
<form name = "frm_store">
<%
	ArrayList<storeDTO> storeList = (ArrayList<storeDTO>)datas;
	
	// index를 부여하여 해당 페이지에서 10개의 항목만 출력하도록 함
	int count = storeList.size();
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
	out.println("<center><h2><a href='control_data.jsp?action=s_list'>[음식점 목록 보기]</a></h2></center>");
	
		out.println("<center> ");
		// index 보여주기
		for (int k = 1; k <= size; k++) {
			if (k == (index + 1)){
			
				out.println("&nbsp;&nbsp;" + k);
			}
				
			else
				out.println("&nbsp;<a href=\"control_data.jsp?action=s_list&index=" + (k - 1) + "\">&nbsp;" + k
						+ "</a>&nbsp;");
			if (k == size){
				out.println("</center><br>");
			}
		}
		
		out.println("<div class='table-responsive'> ");
		out.println("<table style='width:800px;' class='table table-bordered table-hover' border='1' cellspacing=0 align=center>");


		out.println("<tr><th style='text-align:center;'>번호</th><th>장소 id</th><th>장소 이름</th><th>장소 설명</th><th>장소 주소</th></tr>");
		for (int j = start; j < end; j++) {
			storeDTO list = storeList.get(j);
			int tp = j+1;
			out.println("<tr align = center>");
			out.println("<td style='text-align:center;'>" + tp + "</td>");
			out.println("<td>&nbsp;"+list.getStoreID()+"</td>");
			out.println("<td>&nbsp;"+list.getStoreName()+"</td>");
			out.println("<td>" + list.getStoreExplain() + "</td>");
			out.println("<td>" + list.getStoreLocation() + "</td>");
			
			out.println("</tr>");
		}
		out.println("</table></div>");
		// 전체 리스트로 이동
		
%>
</form>

<% request.setAttribute("datas", datas);%>
</body>
</html>