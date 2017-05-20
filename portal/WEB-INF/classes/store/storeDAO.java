package store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class storeDAO {
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
			//select 값 가져오기
			public ArrayList<storeDTO> getDBList(){
				connect();
				ArrayList<storeDTO> dto = new ArrayList<storeDTO>();
				
				String sql = "select * from storeInfo";
				
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						storeDTO storeDTO = new storeDTO();
						storeDTO.setStoreID(rs.getString("storeID"));
						storeDTO.setStoreName(rs.getString("storeName"));
						storeDTO.setStoreExplain(rs.getString("storeExplain"));
						storeDTO.setStoreLocation(rs.getString("storeLocation"));
						
						dto.add(storeDTO);
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
}
