package security;

import java.sql.*;
import java.util.*;


public class beaconDAO {
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
		//추가 -- 수정 필요
		public boolean insertDB(beaconDTO beaconDTO) {
			connect();
			String sql ="insert into installList(installID,installName) values(?,?)";
			String sql2="insert into beaconInfo (beaconID,beaconName,installID) values(?,?,?)";
					
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, beaconDTO.getInstallID());
				pstmt.setString(2, beaconDTO.getInstallName());
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, beaconDTO.getBeaconID());
				pstmt.setString(2, beaconDTO.getBeaconName());
				pstmt.setString(3, beaconDTO.getInstallID());
				
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
		public boolean deleteDB(String beaconID, String installID) {
			connect();
			
			String sql = "delete from beaconInfo where beaconID=?";
			String sql2 = "delete from installList where installID=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, beaconID);
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, installID);
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
		public ArrayList<beaconDTO> getDBList(){
			connect();
			ArrayList<beaconDTO> dto = new ArrayList<beaconDTO>();
			
			String sql = "select * from beaconInfo, installList where beaconInfo.installID = installList.installID;";
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					beaconDTO beaconDTO = new beaconDTO();
					beaconDTO.setBeaconID(rs.getString("beaconID"));
					beaconDTO.setBeaconName(rs.getString("beaconName"));
					beaconDTO.setInstallID(rs.getString("installID"));
					beaconDTO.setInstallName(rs.getString("installName"));
					dto.add(beaconDTO);
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
