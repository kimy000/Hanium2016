<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="store.*,java.util.*" errorPage="BeaconError.jsp"%>
    <% request.setCharacterEncoding("UTF-8"); 
    ArrayList<Integer> signal_orderID = new ArrayList<Integer>();
    int temp=0;
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- store_approval.jsp에서 사용하기 위한 객체 준비 --%>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문승인</title>


</head>
<body style="font-family:나눔고딕;">	
	
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
	<td align="left"><font style="color:#189E42;text-align:center;font-size:7px;">&nbsp;&nbsp;&nbsp;주문내역 조회</font></td></tr>
	</table>
	<br>
	<form name = "frm_approvalconfirm" action="control_data.jsp">
	<input type="hidden" name ="action" value="approval_setting">
	<input type="hidden" name="signal">
	</form>
	<center><div><video src="./image/approval.mp4" autoplay loop width="500px"></div></center>
	   
    <script type="text/javascript">
        //WebSocketEx는 프로젝트 이름
        //websocket 클래스 이름
        var webSocket = new WebSocket('ws://14.63.196.137:8080/portal/websocket');
        var messageTextArea = document.getElementById("messageTextArea");
        var textMessage = document.getElementById("textMessage");
        
        webSocket.onerror = function(event) {
            onError(event)
          };
          webSocket.onopen = function(event) {
            onOpen(event)
          };
          webSocket.onmessage = function(event) {
            onMessage(event)
          };
          function onMessage(event) {
        		  if(event.data != null){
         			 document.frm_approvalconfirm.signal.value=event.data;
         		
         			 document.frm_approvalconfirm.submit();  
         		  }	
        	  }
          
          function onOpen(event) {
        	  frm_test.messageTextArea.value += "연결 성공\n";
          }
          function onError(event) {
            alert(event.data);
          }
          function send() {
        	  messageTextArea.value += "나 : " + textMessage.value + "\n";
              webSocket.send(textMessage.value);
              textMessage.value = "";
          }
        //연결 끊기
          function disconnect(){
              webSocket.close();
          }

</script>
<% request.setAttribute("datas", datas);
	session.setAttribute("signal_orderID", signal_orderID);%>
</body>
</html>