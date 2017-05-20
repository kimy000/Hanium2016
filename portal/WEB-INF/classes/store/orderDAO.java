package store;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class orderDAO {
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
			//select 媛� 媛��졇�삤湲� , orderList
			public ArrayList<orderDTO> getDBList(){
				connect();
				ArrayList<orderDTO> dto = new ArrayList<orderDTO>();
				
				String sql = "select orderID,orderList.productID,productInfo.productName,productAmount,orderList.userID,userInfo.userName,payConfirm  from orderList, productInfo, userInfo where orderList.userID = userInfo.userID and orderList.productID = productInfo.productID ORDER BY orderID";
				
				try {
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						orderDTO orderDTO = new orderDTO();
						
						orderDTO.setOrderID(rs.getInt("orderID"));
						orderDTO.setProductID(rs.getString("productID"));
						orderDTO.setProductName(rs.getString("productName"));
						orderDTO.setProductAmount(rs.getInt("productAmount"));
						orderDTO.setUserID(rs.getString("userID"));
						orderDTO.setPayConfirm(rs.getBoolean("payConfirm"));	
						orderDTO.setUserName(rs.getString("userName"));
						orderDTO.setProductName(rs.getString("productName"));
						
						/*orderDTO.setOrderID(rs.getInt("orderID"));
						orderDTO.setProductID(rs.getString("productID"));
						orderDTO.setProductAmount(rs.getInt("productAmount"));
						orderDTO.setUserID(rs.getString("userID"));
						orderDTO.setPayConfirm(rs.getBoolean("payConfirm"));
						*/
						dto.add(orderDTO);
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
			//select 
			public orderDTO getDB(int orderID){
				connect();
				
				String sql = "select orderID,orderList.productID,productInfo.productName,productAmount,orderList.userID,userInfo.userName,payConfirm  from orderList, productInfo, userInfo where orderID=? and orderList.userID = userInfo.userID and orderList.productID = productInfo.productID";
				orderDTO orderDTO = new orderDTO();
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, orderID);
					ResultSet rs = pstmt.executeQuery();
					
					rs.next();
					orderDTO.setOrderID(rs.getInt("orderID"));
					orderDTO.setProductID(rs.getString("productID"));
					orderDTO.setProductName(rs.getString("productName"));
					orderDTO.setProductAmount(rs.getInt("productAmount"));
					orderDTO.setUserID(rs.getString("userID"));
					orderDTO.setPayConfirm(rs.getBoolean("payConfirm"));	
					orderDTO.setUserName(rs.getString("userName"));
					orderDTO.setProductName(rs.getString("productName"));
						
					rs.close();

				}catch(SQLException e) {
					e.printStackTrace();
				}
				finally {
					disconnect();
				}
				return orderDTO;
			}
			//product 媛� 媛��졇�삤湲�
			public orderDTO settingData(int orderID){ // 媛� �뱾怨� �삤�뒗 遺�遺꾨뱾 �닔�젙
				connect();
				
				String sql1 = "select productAmount, amount, payConfirm, orderList.productID from orderList, productInfo where orderID=? and orderList.productID = productInfo.productID";
				
				orderDTO orderdto = new orderDTO(); 
				//productDTO productDTO = new productDTO();
				//int result;
				try {
					pstmt = conn.prepareStatement(sql1);
					pstmt.setInt(1, orderID);
					ResultSet rs = pstmt.executeQuery();
					
					rs.next();
					orderdto.setPayConfirm(rs.getBoolean("payConfirm"));
					orderdto.setProductAmount(rs.getInt("productAmount"));
					orderdto.setTpamount(rs.getInt("productInfo.amount"));
					orderdto.setProductID(rs.getString("productID"));
					rs.close();
					
				}catch(SQLException e) {
					e.printStackTrace();
					//return false;
				}
				finally {
					disconnect();
				}
		
				return orderdto;
			}
			
			//product�쓽 �닔�웾 媛먯냼 
			public boolean setAmount(orderDTO orderDTO){
				connect();
				String sql = "update productInfo set amount=? where productID=?";
				int result =0;
				try {
					pstmt = conn.prepareStatement(sql);
					result = orderDTO.getTpamount() - orderDTO.getProductAmount();
					pstmt.setInt(1,result);
					pstmt.setString(2, orderDTO.getProductID());
					
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
			//payConfirm true濡� 諛붽씀�뒗 寃�
			public boolean setApproval(int orderID){
				connect();
				
				String sql = "update orderList set payConfirm=? where orderID=?";
				
				try {	
					pstmt = conn.prepareStatement(sql);
					pstmt.setBoolean(1, true);
					pstmt.setInt(2, orderID);
					pstmt.executeUpdate();
					System.out.println("payConfirm true媛믪쑝濡� 諛붽퓞. : orderDAO,setApproval"+orderID);
										
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
