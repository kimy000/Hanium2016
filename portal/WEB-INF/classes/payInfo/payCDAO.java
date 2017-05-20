package payInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class payCDAO {
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
	// select 값 가져오기 :payCatagory
	public ArrayList<payCDTO> getPCDBList(){
		connect();
		ArrayList<payCDTO> dto = new ArrayList<payCDTO>();
					
		String sql = "select * from payCatagory";
					
		try {
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
						
		while(rs.next()) {
			payCDTO payCDTO = new payCDTO();
							
			payCDTO.setPayCatagoryID(rs.getString("payCatagoryID"));
			payCDTO.setPayCatagoryName(rs.getString("payCatagoryName"));
			dto.add(payCDTO);
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
	//추가 : payCatagory
	public boolean insertDB(payCDTO payCDTO) {
		connect();
					
		String sql="insert into payCatagory (payCatagoryID,payCatagoryName) values(?,?)";
					
	try {
		pstmt = conn.prepareStatement(sql);
						
		pstmt.setString(1, payCDTO.getPayCatagoryID());
		pstmt.setString(2, payCDTO.getPayCatagoryName());
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
	//삭제 : paySection
		public boolean deleteDB(String payCatagoryID) {
			connect();
					
			String sql = "delete from payCatagory where payCatagoryID=?";
					
			try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, payCatagoryID);
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
}
