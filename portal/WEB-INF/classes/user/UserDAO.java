package user;

import java.sql.*;
import java.util.*;


public class UserDAO {
	//데이터베이스 연결관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		//데이터베이스 연결관련 정보를 문자열로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		
		String jdbc_url = "jdbc:mysql://14.63.196.137/portal"; //주소, 스키마 이름
		
		//서버 연결하는 함수
		void connect() {
			try{
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url,"teamdid","dongduk");
				} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		void disconnect() {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		//추가
		public boolean insertDB(UserDTO userdto) {
			connect();
			
			String sql="insert into userInfo (userID,userPasswd,userName,ANDROID_ID,userMail, userAgesection, userInteresting) values(?,?,?,?,?,?,?)";
					
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userdto.getUserID());
				pstmt.setString(2, userdto.getUserPasswd());
				pstmt.setString(3, userdto.getUserName());
				pstmt.setString(4, userdto.getUserMail());
				pstmt.setString(5, userdto.getANDROID_ID());
				pstmt.setString(6, userdto.getUserAgesection());
				pstmt.setString(7, userdto.getUserInteresting());
				
				pstmt.executeUpdate();
				
			} catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		//수정
		public boolean updateDB(UserDTO userdto) {
			connect();
			
			String sql = "update userInfo set userID=?,userPasswd=?, userName=?, userMail=?, ANDROID_ID=?, userAgesection=?, userInteresting=? where userID=?";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userdto.getUserID());
				pstmt.setString(2, userdto.getUserPasswd());
				pstmt.setString(3, userdto.getUserName());
				pstmt.setString(4, userdto.getUserMail());
				pstmt.setString(5, userdto.getANDROID_ID());
				pstmt.setString(6, userdto.getUserAgesection());
				pstmt.setString(7, userdto.getUserInteresting());
				pstmt.setString(8, userdto.getUserID());
				pstmt.executeUpdate();
			} catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		//삭제
		public boolean deleteDB(String userID) {
			connect();
			
			String sql = "delete from userInfo where userID=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
		}
		
		//select 값 가져오기
		public ArrayList<UserDTO> getDBList(){
			connect();
			ArrayList<UserDTO> dto = new ArrayList<UserDTO>();
			
			String sql = "select * from userInfo";
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					UserDTO UserDTO = new UserDTO();
					UserDTO.setUserID(rs.getString("userID"));
					UserDTO.setUserPasswd("*********");
					UserDTO.setUserName(rs.getString("userName"));
					UserDTO.setUserMail(rs.getString("userMail"));
					UserDTO.setANDROID_ID(rs.getString("ANDROID_ID"));
					UserDTO.setUserAgesection(rs.getString("userAgesection"));
					UserDTO.setUserInteresting(rs.getString("userInteresting"));		
					dto.add(UserDTO);
				}
				rs.close();

			}catch(SQLException e) {
				e.printStackTrace();
				
			}
			finally {
				disconnect();
			}
			return dto;	
		}
		//getDB 수정할떄 가지고 오는 것
		public UserDTO getDB(String userid) {
			connect();
			
			String sql = "select * from userInfo where userID=?";
			UserDTO dto = new UserDTO();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				dto.setUserID(rs.getString("userID"));
				dto.setUserPasswd("*********");
				dto.setUserName(rs.getString("userName"));
				dto.setUserMail(rs.getString("userMail"));
				dto.setANDROID_ID(rs.getString("ANDROID_ID"));
				dto.setUserAgesection(rs.getString("userAgesection"));
				dto.setUserInteresting(rs.getString("userInteresting"));		
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return dto;
		}
}