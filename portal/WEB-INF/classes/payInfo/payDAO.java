package payInfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import user.UserDTO;

public class payDAO {
	//�뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 蹂��닔 �꽑�뼵
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			//�뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://14.63.196.137/portal"; //二쇱냼, �뒪�궎留� �씠由�
			
			//�꽌踰� �뿰寃고븯�뒗 �븿�닔
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
			
			
			//select 媛� 媛��졇�삤湲� productInfo
			public ArrayList<payDTO> getPDBList(){
				connect();
				ArrayList<payDTO> dto = new ArrayList<payDTO>();
				
				String sql = "select payInfoID, cardName, payDate, payAmount,productName,userName,payCatagoryName,payInfo.beaconNum from payInfo,cardInfo,orderList,productInfo, payCatagory,beaconInfo,userInfo where payInfo.cardID = cardInfo.cardID and payInfo.userID = userInfo.userID and orderList.userID = userInfo.userID and payInfo.payCatagoryID = payCatagory.payCatagoryID and payInfo.beaconNum = beaconInfo.beaconNum and orderList.productID = productInfo.productID;";
				
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						payDTO payDTO = new payDTO();
						
						payDTO.setPayInfoID(rs.getInt("payInfoID"));
						payDTO.setCardName(rs.getString("cardName"));
						payDTO.setPayDate(rs.getString("payDate"));
						payDTO.setPayAmount(rs.getString("payAmount"));
						payDTO.setProductName(rs.getString("productName"));
						payDTO.setUserName(rs.getString("userName"));
						payDTO.setPayCatagoryName(rs.getString("payCatagoryName"));
						payDTO.setBeaconNum(rs.getInt("beaconNum"));
						dto.add(payDTO);
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
			//select 媛� 媛��졇�삤湲� ticketInfo -- �닔�젙 �븘�슂
			public ArrayList<payDTO> getTDBList(){
				connect();
				ArrayList<payDTO> dto = new ArrayList<payDTO>();
				
				String sql = "select payInfoID, cardName, payDate, payAmount,ticketName,userName,payCatagoryName,payInfo.beaconNum from payInfo,cardInfo, ticketbook,ticketInfo,ticketDInfo, payCatagory,beaconInfo,userInfo where payInfo.ticketbookID = ticketbook.ticketbookID AND ticketbook.ticketID = ticketInfo.ticketID AND ticketInfo.ticketDID = ticketDInfo.ticketDID AND payInfo.cardID = cardInfo.cardID AND payInfo.userID = userInfo.userID AND payInfo.ticketbookID is not null AND payInfo.payCatagoryID = payCatagory.payCatagoryID AND payInfo.beaconNum= beaconInfo.beaconNum";
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						payDTO payDTO = new payDTO();
						
						payDTO.setPayInfoID(rs.getInt("payInfoID"));
						payDTO.setCardName(rs.getString("cardName"));
						payDTO.setPayDate(rs.getString("payDate"));
						payDTO.setPayAmount(rs.getString("payAmount"));		
						payDTO.setTicketName(rs.getString("ticketName"));
						payDTO.setUserName(rs.getString("userName"));
						payDTO.setPayCatagoryName(rs.getString("payCatagoryName"));
						payDTO.setBeaconNum(rs.getInt("beaconNum"));
						dto.add(payDTO);
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
