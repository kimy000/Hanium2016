<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8" import="java.util.*, signup.*" errorPage="BeaconError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="signup.SignupDTO" /> 
<jsp:useBean id="dao" class="signup.SignupDAO" />

<jsp:setProperty name="dto"  property="*" />
 
<%
	//action이라는 파라미터의 값을 가져온다
	String action = request.getParameter("action");
	int index_dto = 0;
	
	//DTO 객체를 배열로 저장해둔다
	ArrayList<SignupDTO> sdto = new ArrayList<SignupDTO>();
	
	//현재 로그인된 세션 아이디와 비밀번호를 저장하는 변수
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionPasswd = (String)session.getAttribute("sessionPasswd");
	boolean admin =(Boolean)session.getAttribute("admin");
	
		
	if(action != null) {
		if(action.equals("signup")){
			String mail = dto.getMail1() + "@" + dto.getMail2();
			dto.setMail(mail);
			
			if(dao.insertDB(dto)){
				//sdto = dao.getDBList(dto.getId()); 
				request.setAttribute("data", dto);
				// 막 값이 들어간거 위치 (index 포함해서 넘겨줘야함)
				
				pageContext.forward("signupPro.jsp");
			}else
				throw new Exception("db오류");
		}
			
		else if(action.equals("update")){
		
			if(dao.updateDB(dto)){
				sdto = dao.getDBList(dto.getId()); 
				request.setAttribute("datas", sdto);
				
				if(dto.isAdmin() == true)
				pageContext.forward("signupUpdate.jsp?");
				else
					pageContext.forward("signUpdate.jsp?dis='false'");
			}
		}
		
		else if(action.equals("delete")){
			dto = dao.getDB(sessionId);
			
			if(dao.deleteDB(dto)){
				sdto = dao.getDBList(dto.getId());
				request.setAttribute("datas", sdto);
				//index_dto = dto.getNum();
				
				pageContext.forward("logout.jsp?");
			}
		}
	
		else if(action.equals("login")){
			//db의 내용 가져와서
			sdto = dao.getDBList(dto.getId());			
			//request 객체에 sto
			request.setAttribute("datas", sdto);
			//로그인 성공
			if(dao.logincheck(dto.getId(), dto.getPasswd()) == 1){
				
				request.setAttribute("datas", sdto);
				session.setAttribute("sessionId", dto.getId());
				session.setAttribute("sessionPasswd", dto.getPasswd());
				session.setAttribute("admin", sdto.get(dto.getNum()).isAdmin());
				
				if(sdto.get(dto.getNum()).isAdmin())
				pageContext.forward("index.html?");
				else
				pageContext.forward("storeHome.jsp?");	
			}
			
			//로그인 실패. 팝업 추가하면 좋을듯
			else if(dao.logincheck(dto.getId(), dto.getPasswd()) == 0 ){				
				out.println("<script language=javascript>alert('로그인에 실패하였습니다. 패스워드를 확인해주세요.');</script>");
				response.sendRedirect("intro.jsp?");
			}
				
			else{
				
				out.println("<script language='javascript'>alert("+"로그인에 실패하였습니다. 아이디를 확인해주세요."+");</script>");
				
				response.sendRedirect("intro.jsp?");
			}
		}
	}
%>