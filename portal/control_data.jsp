<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.*, App.*, store.*,payInfo.*,ticket.*,security.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<%-- userInfo 愿??useBean --%>
<jsp:useBean id="u_dto" class="user.UserDTO" /> 
<jsp:useBean id="u_dao" class="user.UserDAO" />
<jsp:setProperty name="u_dto"  property="*" />

<%-- beaconInfo 愿??useBean --%>
<jsp:useBean id="b_dto" class="security.beaconDTO" /> 
<jsp:useBean id="b_dao" class="security.beaconDAO" />
<jsp:setProperty name="b_dto"  property="*" />

<%-- AppInfo 愿??useBean --%>
<jsp:useBean id="a_dto" class="App.appDTO" />
<jsp:useBean id="a_dao" class="App.appDAO" />
<jsp:setProperty name="a_dto" property="*"/>
<%-- storeInfo 愿??useBean --%>
<jsp:useBean id="s_dto" class="store.storeDTO" />
<jsp:useBean id="s_dao" class="store.storeDAO" />
<jsp:setProperty name="s_dto" property="*"/>

<%-- orderlist 愿??useBean --%>
<jsp:useBean id="o_dto" class="store.orderDTO" />
<jsp:useBean id="o_dao" class="store.orderDAO" />
<jsp:setProperty name="o_dto" property="*"/>

<%-- store_approval 愿??useBean --%>
<jsp:useBean id="sa_dto" class="store.orderDTO" />
<jsp:useBean id="sa_dao" class="store.orderDAO" />
<jsp:setProperty name="sa_dto" property="*"/>

<%-- payInfolist 愿??useBean --%>
<jsp:useBean id="p_dto" class="payInfo.payDTO" />
<jsp:useBean id="p_dao" class="payInfo.payDAO" />
<jsp:setProperty name="p_dto" property="*"/>
<jsp:useBean id="pc_dto" class="payInfo.payCDTO" />
<jsp:useBean id="pc_dao" class="payInfo.payCDAO" />
<jsp:setProperty name="pc_dto" property="*"/>

<%-- ticketlist 愿??useBean --%>
<jsp:useBean id="t_dto" class="ticket.ticketDTO" />
<jsp:useBean id="t_dao" class="ticket.ticketDAO" />
<jsp:setProperty name="t_dto" property="*"/>


<%
	String action = request.getParameter("action");
	String userId = request.getParameter("userID");
	String payCatagoryID = request.getParameter("payCatagoryID");
	String beaconID = request.getParameter("beaconID");
	String installID = request.getParameter("installID");
	//int signal = Integer.parseInt(); // 二쇰Ц?뱀씤??紐⑤컮?쇱뿉???섏뼱?ㅻ뒗 ?좏샇 
	String signal = request.getParameter("signal");
	ArrayList<Integer> signal_orderID  = new ArrayList<Integer>();
	
	
	ArrayList<UserDTO> Udto = new ArrayList<UserDTO>();
	ArrayList<beaconDTO> bdto = new ArrayList<beaconDTO>();
	ArrayList<appDTO> Adto = new ArrayList<appDTO>();
	ArrayList<storeDTO> sdto = new ArrayList<storeDTO>();
	ArrayList<orderDTO> odto = new ArrayList<orderDTO>();
	ArrayList<payDTO> ppdto = new ArrayList<payDTO>(); // payInfo List
	ArrayList<payDTO> ptdto = new ArrayList<payDTO>(); // payInfo List
	ArrayList<payCDTO> pcdto = new ArrayList<payCDTO>(); // payInfo payCatagory ?섏젙 ?꾩슂
	ArrayList<ticketDTO> tdto = new ArrayList<ticketDTO>();
	orderDTO sadto = new orderDTO(); // store_approval dto
		//int dbnum;
		
		//userInfo list 蹂댁뿬二쇰뒗 肄붾뱶
		if(action != null) {
			if(action.equals("u_list")){
				if(!u_dao.getDBList().isEmpty()){
					Udto = u_dao.getDBList();
					request.setAttribute("datas", Udto);
					//媛??ｌ?嫄??뺤씤?댁빞吏
					pageContext.forward("user_content.jsp?");
					
				}
				else
					throw new Exception("db?ㅻ쪟+user");
				
			}
			if(action.equals("uM_list")){
				if(!u_dao.getDBList().isEmpty()){
					Udto = u_dao.getDBList();
					request.setAttribute("datas", Udto);
					//媛??ｌ?嫄??뺤씤?댁빞吏
					pageContext.forward("userMAC_content.jsp?");
					
				}
				else
					throw new Exception("db?ㅻ쪟+user");
				
			}
			//AppInfo list 蹂댁뿬二쇰뒗 肄붾뱶
			else if(action.equals("a_list")){
				if(!a_dao.getDBList().isEmpty()){
					Adto = a_dao.getDBList();
					request.setAttribute("datas", Adto);
					pageContext.forward("App_content.jsp?");

				}
				else {
					throw new Exception("db?ㅻ쪟+APP");
				}
				
			}
			//beaconInfo list 蹂댁뿬二쇰뒗 肄붾뱶
			else if(action.equals("b_list")){
				if(!b_dao.getDBList().isEmpty()){
					bdto = b_dao.getDBList();
					request.setAttribute("datas", bdto);
					pageContext.forward("beacon_content.jsp?");

				}
				else {
					throw new Exception("db?ㅻ쪟+beacon");
				}
				
			}
			//storeInfo list 蹂댁뿬二쇰뒗 肄붾뱶
			else if(action.equals("s_list")){
				if(!s_dao.getDBList().isEmpty()){
					sdto = s_dao.getDBList();
					request.setAttribute("datas", sdto);
					pageContext.forward("store_content.jsp?");
				}
				else {
					throw new Exception("db error + store");
				}
			}
			//orderList 蹂댁뿬二쇰뒗 肄붾뱶_select
			else if(action.equals("o_list")){
				if(!o_dao.getDBList().isEmpty()){
					odto = o_dao.getDBList();
					request.setAttribute("datas", odto);
					pageContext.forward("store_orderlist.jsp?");
				}
				else {
					throw new Exception("db error + store + order");
				}
			}
			else if(action.equals("o_list_master")){
				if(!o_dao.getDBList().isEmpty()){
					odto = o_dao.getDBList();
					request.setAttribute("datas", odto);
					pageContext.forward("store_orderlistformaster.jsp?");
				}
				else {
					throw new Exception("db error + store + order+ for master");
				}
			}
			//payInfo 蹂댁뿬二쇰뒗 肄붾뱶_select, product
			else if(action.equals("pp_list")){
				if(!p_dao.getPDBList().isEmpty()){
					ppdto = p_dao.getPDBList();
					request.setAttribute("datas", ppdto);
					pageContext.forward("payPlist_content.jsp?");
				}
				else {
					throw new Exception("db error + payInfo + pplist");
				}
			}
			//payInfo 蹂댁뿬二쇰뒗 肄붾뱶_select, ticket
			else if(action.equals("pt_list")){
				if(!p_dao.getTDBList().isEmpty()){
					ptdto = p_dao.getTDBList();
					request.setAttribute("datas", ptdto);
					pageContext.forward("payTlist_content.jsp?");
				}
				else {
					throw new Exception("db error + payInfo + ptlist");
				}
			}
			//payCatagory 蹂댁뿬二쇰뒗 肄붾뱶_select
			else if(action.equals("pc_list")){
				if(!pc_dao.getPCDBList().isEmpty()){
					pcdto = pc_dao.getPCDBList();
					request.setAttribute("datas", pcdto);
					pageContext.forward("paymg_content.jsp?");
				}
				else {
					throw new Exception("db error + payInfo + management");
				}
			}
			//ticketbook 蹂댁뿬二쇰뒗 肄붾뱶_select
			else if(action.equals("t_list")){
				if(!t_dao.getDBList().isEmpty()){
					tdto = t_dao.getDBList();
					request.setAttribute("datas", tdto);
					pageContext.forward("ticket_content.jsp?");
				}
				else {
					throw new Exception("db error + ticketBook + list");
				}
			}
			//store_approval을 위한 코드 점원에게 어떤 사람이 뭐를 주문했는지를 알려주는 데이터 select
			//아랫 부분에 액션을 signal로 바꾸기로 하고 값이 insert면 실행하도록하기
			//새로 인서트된 값을 긁어오도록 하는 mysql문법 필요
			else if(action.equals("approval_setting")){
				int orderID = Integer.parseInt(signal);
				
				signal_orderID = (ArrayList<Integer>)session.getAttribute("signal_orderID");
				
				signal_orderID.add(orderID);
				
				Thread.sleep(10000); 
				pageContext.forward("forstoreapproval.jsp");
			}
			else if(action.equals("approval")){
				signal_orderID = (ArrayList<Integer>)session.getAttribute("signal_orderID");
				if(signal_orderID.isEmpty() == false){
					System.out.println(signal_orderID.isEmpty()+" 비어있는지 판단approval if문 내 for문전");
				for(int i=0; i<signal_orderID.size();i++){
					
						int orderID = signal_orderID.get(i);
					
						if(sa_dao.getDB(orderID) != null){
							sadto = sa_dao.getDB(orderID);
							request.setAttribute("datas", sadto);
						
							pageContext.forward("sapprovalForm.jsp?signal="+orderID);
						}
						else {
							throw new Exception("db error + store_approval + list + 여러개 처리 안됨");
						}
						
					}
				}
				else{
					response.sendRedirect("store_approval.jsp");
			 		return;
				}
				
			}
			 
			else if(action.equals("approval_true")){
				signal_orderID = (ArrayList<Integer>)session.getAttribute("signal_orderID");
				int orderID = Integer.parseInt(signal);
				if(sa_dao.setApproval(orderID)){
					orderDTO temp = sa_dao.settingData(orderID);
					if(sa_dao.setAmount(temp)){// ?섎웾 源롫뒗 ?묒뾽
					 	if(signal_orderID.isEmpty() != true){
					 		pageContext.forward("forstoreapproval.jsp");
					 	}
						else{
							response.sendRedirect("store_approval.jsp");
					 		return;
						} 
					}
					for(int i = 0; i<signal_orderID.size();i++){
						if(orderID == signal_orderID.get(i) )
							signal_orderID.remove(i);	
					}
				}
				else {
						throw new Exception("db error + store_approval + list");
					 }
		}
			// 異붽?
			//userInfo insert
			else if(action.equals("u_insert")){
				
				if(u_dao.insertDB(u_dto)){
					
					response.sendRedirect("control_data.jsp?action=u_list");	
					return;
				}
				else
					throw new Exception();
			}
			//beaconInfo insert
			else if(action.equals("b_insert")){
				if(b_dao.insertDB(b_dto)){
					response.sendRedirect("control_data.jsp?action=b_list");
					return;
				}
				else {
					throw new Exception("db error + beacon + insert");
				}
			}
			//payCatagory insert
			else if(action.equals("pc_insert")){
				if(pc_dao.insertDB(pc_dto)){
					response.sendRedirect("control_data.jsp?action=pc_list");
					return;
				}
				else {
					throw new Exception("db error + pay + management + insert");
				}
			}
			//?섏젙????
			else if(action.equals("u_edit")){
				UserDTO userdto = u_dao.getDB(userId);
				request.setAttribute("udto",userdto);
				pageContext.forward("user_listedit.jsp");
				
			}
			
			// ?섏젙??由ъ뒪???뺤씤?섎룄濡?
			else if(action.equals("u_editlist")) {
				
				ArrayList<UserDTO> datas = u_dao.getDBList();
				request.setAttribute("datas", datas);
				request.setAttribute("userID", userId);
				pageContext.forward("user_content.jsp?userID="+userId);
			} 
			//update 
			else if(action.equals("u_update")){
				
				if(u_dao.updateDB(u_dto)) {
					UserDTO userdto = u_dao.getDB(userId);
					
					request.setAttribute("userID", u_dto.getUserID());
					request.setAttribute("datas", userdto);
					pageContext.forward("control_data.jsp?action=u_editlist");
				}
				else
					throw new Exception("DB error");
				
			} 
			//delete 
			 else if(action.equals("u_delete")){
				if(u_dao.deleteDB(userId)) {
					response.sendRedirect("control_data.jsp?action=u_list");
					return;
				}
				else
					throw new Exception("DB error + user + delete");		
			} 
			 else if(action.equals("b_delete")){
					if(b_dao.deleteDB(beaconID,installID)) {
						response.sendRedirect("control_data.jsp?action=b_list");
						return;
					}
					else
						throw new Exception("DB error + beacon + delete");		
				}
			 else if(action.equals("pc_delete")){
					if(pc_dao.deleteDB(payCatagoryID)) {
						response.sendRedirect("control_data.jsp?action=pc_list");
						return;
					}
					else
						throw new Exception("DB error + payCatagory + delete");		
				} 
		}
	%>