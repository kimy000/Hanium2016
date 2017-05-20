package signup;
import java.sql.*;
import java.util.*;


public class SignupDAO {
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	//占쌩곤옙
	public boolean insertDB(SignupDTO signupdto) {
		connect();
		
		String sql="insert into manageridDB(mgdbId,mg_id,mg_passwd,mg_mail,mg_name,mg_admin) values(?,?,?,?,?,?)";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, signupdto.getNum());
			pstmt.setString(2, signupdto.getId());
			pstmt.setString(3, signupdto.getPasswd());
			pstmt.setString(4, signupdto.getMail());
			pstmt.setString(5, signupdto.getName());
			pstmt.setBoolean(6, signupdto.isAdmin());
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		return true;
	}
	
	public boolean updateDB(SignupDTO signupdto) throws SQLException{
		connect();
		
		String sql="update manageridDB set mg_passwd=?, mg_mail=?, mg_name=? where mg_id=?";
				
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, signupdto.getPasswd());
			pstmt.setString(2, signupdto.getMail());
			pstmt.setString(3, signupdto.getName());
			pstmt.setString(4, signupdto.getId());
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	public boolean deleteDB(SignupDTO signupdto) throws SQLException{
		connect();
		
		String sql="delete from manageridDB where mg_id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, signupdto.getId());
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
	
	//getDB
	public SignupDTO getDB(String mg_Id) {
		connect();
		
		String sql = "select * from manageridDB where mg_Id=?";
		SignupDTO dto = new SignupDTO();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mg_Id);
			ResultSet rs = pstmt.executeQuery();
			
			//占싹놂옙占쏙옙 占신댐옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占승댐옙
			rs.next();
			
			dto.setNum(rs.getInt("mgdbId"));
			dto.setId(rs.getString("mg_id"));
			dto.setPasswd(rs.getString("mg_passwd"));
			dto.setMail(rs.getString("mg_mail"));
			dto.setName(rs.getString("mg_name"));
			dto.setAdmin(rs.getBoolean("mg_admin"));
			
			rs.close();
			System.out.println("dao�궡�뿉�꽌 諛쏆븘�삤�뒗 admin�쓽 媛� getdb:"+dto.isAdmin());
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return dto;
	}
	
	public ArrayList<SignupDTO> getDBList(String mg_Id) {
		connect();
		
		String sql = "select * from manageridDB where mg_Id=?";
		ArrayList<SignupDTO> dto = new ArrayList<SignupDTO>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mg_Id);
			ResultSet rs = pstmt.executeQuery();
			
			// 占쏙옙체 占신댐옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쌨소듸옙
			while(rs.next()) {
				SignupDTO SignupDTO = new SignupDTO();
				
				SignupDTO.setNum(rs.getInt("mgdbId"));
				SignupDTO.setId(rs.getString("mg_id"));
				SignupDTO.setPasswd(rs.getString("mg_passwd"));
				SignupDTO.setMail(rs.getString("mg_mail"));
				SignupDTO.setName(rs.getString("mg_name"));
				SignupDTO.setAdmin(rs.getBoolean("mg_admin"));
				System.out.println("dao�궡�뿉�꽌 諛쏆븘�삤�뒗 admin�쓽 媛� getdblist:"+SignupDTO.isAdmin());
				dto.add(SignupDTO);
			}
			
			rs.close();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return dto;
	}
	
	public int logincheck(String id, String pwd) throws Exception {
		String dbpasswd = "";
		int result = -1;
		
		try{
			connect();
			//sql占쏙옙 占쏙옙占쏙옙 占십울옙
			pstmt = conn.prepareStatement("select * from manageridDB where mg_id=?");
			pstmt.setString(1, id);
			//pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("mg_passwd");
			
				if(dbpasswd.equals(pwd))
					result = 1; //占쏙옙占쏙옙 占쏙옙占쏙옙
				
				else
					result = 0; //password 틀占쏙옙
				
			} else
				result = -1; // 占쌔댐옙 id 占쏙옙占쏙옙
			
		} catch(Exception ex){
			ex.printStackTrace();
		} finally {
			disconnect();	}
		return result;
	}
	
	//id 以묐났�솗�씤
	public int confirmID(String id) throws Exception {
		int x = -1;
		
		try {
			connect();
			pstmt = conn.prepareStatement("select mg_id from manageridDB where mg_id=?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()!= false)
				x = 1; //�빐�떦 �븘�씠�뵒 �엳�쓬
			else
				x = -1; //�빐�떦 �븘�씠�뵒 �뾾�쓬
		} catch(Exception ex){
			ex.printStackTrace();
		} finally {
			disconnect();	}
		
		return x;
	}
	
	public static SignupDAO getInstance(){
		
		SignupDAO SignupDAO = null;
		
		return SignupDAO;
		
	}
}
