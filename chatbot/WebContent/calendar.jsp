<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width=100%>
<tr><td>
<% 
	Calendar cal = Calendar.getInstance();
	int year;
	int month;
	int printmonth;
	int day = cal.get(Calendar.DATE); 

	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");

	if(sYear == null && sMonth == null) {
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH);
		printmonth=month+1;
	}
	else {
		year = Integer.parseInt(sYear);
		month = Integer.parseInt(sMonth);
		
		if(month<0)
			month = 0;
		if(month>11)
			month=11;
		
		printmonth=month+1;
		
	}
	//year ?대룞
	out.print("<a href='calendar.jsp?year="+(year-1)+"&month="+(month)+"'>"+"<"+"</a>"+year); 
  	out.print("<a href='calendar.jsp?year="+(year+1)+"&month="+(month)+"'>"+">"+"</a>"+"</td>");
  	
  	//month ?대룞
  	
  	out.print("<td align=center>"+"<a href='calendar.jsp?month="+(month-1)+"&year=" + year +"'>"+"<"+"</a>");
  	out.print(printmonth+"<a href='calendar.jsp?month="+(month+1)+ "&year=" +year + "'>"+">"+"</a>"+"</td>");
    out.print("<td align=right>"+year+"-"+printmonth+"-"+day);
  		
%>
</td>
</tr>

</table>
<table border=1 width='100%' cellspacing="0">
<tr align=center><td><font color="red">일</font></td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr>
<%
	cal.set(year,month,1);	
	int date = cal.getMinimum(Calendar.DATE);
	int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int startday = cal.get(Calendar.DAY_OF_WEEK);
	
	for(int i = 0; i < 5; i++) {
		out.print("<tr align=center>");
		for(int j = 1; j <= 7; j++) {
			out.print("<td>");
			if(j == 1)
				out.print("<font color= red>");
			if(i == 0) {
				if(j >= startday)
					out.print("" + date++);
				else
					out.print("&nbsp;");
			}	
			else if(date > end)
				out.print("&nbsp;");
			else
				out.print(date++);
			if(j == 1)
				out.print("</font>");
		}
		out.print("</td>");
		out.print("</tr>");
	}			
	
%>
</body>
//usebean 넣을부분
</html>