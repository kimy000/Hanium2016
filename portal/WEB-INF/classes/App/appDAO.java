package App;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class appDAO {
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
			public ArrayList<appDTO> getDBList(){
				connect();
				ArrayList<appDTO> dto = new ArrayList<appDTO>();
				
				String sql = "select * from appInfo";
				
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						appDTO appDTO = new appDTO();
						
						appDTO.setAppInfoID(rs.getString("appInfoID"));
						appDTO.setAppUday(rs.getString("appUday"));
						appDTO.setAppUVersion(rs.getString("appUVersion"));
						appDTO.setAppUInfo(rs.getString("appUInfo"));
						appDTO.setDevelopername(rs.getString("developername"));
					
						dto.add(appDTO);
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
