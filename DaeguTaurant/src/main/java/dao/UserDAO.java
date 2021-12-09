package dao;

import static db.JdbcUtil.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.UserVO;

public class UserDAO {

	private Connection con;
	
	private static UserDAO instance;

	public UserDAO() {}
	
	public static UserDAO getInstance() {

		if(instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		 
		this.con = con;
	}

	public UserVO selectLoginUser(String user_id, String user_pw, String user_nickname) throws Exception{
		
		UserVO userVO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM user_Info WHERE user_id = ? AND user_pw =? ";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			pstmt.setString(2,user_pw);
	
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new UserVO();
			
				userVO.setUser_id(rs.getString("user_id"));
				userVO.setUser_pw(rs.getString("user_pw"));
				userVO.setUser_name(rs.getString("user_name"));
				userVO.setUser_nickname(rs.getString("user_nickname"));
				userVO.setUser_level(rs.getInt("user_level"));
			}
			
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return userVO;
	}

	
	
	
	
	
	
	public int insertUser(UserVO userVO) {
		
		int insertCount = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO user_Info(user_id, user_pw, user_name, user_nickname) values(?,?,?,?)";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userVO.getUser_id());
			pstmt.setString(2, userVO.getUser_pw());
			pstmt.setString(3, userVO.getUser_name());
			pstmt.setString(4, userVO.getUser_nickname());
		
			insertCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
			close(pstmt);
		}
		
		return insertCount;
		
		
		
		
	}

	public  String selectUserId(String user_id) {
		
		String dbUserId = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT user_id FROM user_Info WHERE user_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				dbUserId = rs.getString("user_id");
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dbUserId;
	}

	public String selectUserNickname(String user_nickname) {
		String dbUserNickname = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT user_nickname FROM user_Info WHERE user_nickname = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				dbUserNickname = rs.getString("user_nickname");
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dbUserNickname;
	}

	public int deleteUser_Info(String user_id, String user_pw) {
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String dbPasswd = null;
		
		
		try {
			pstmt = con.prepareStatement("SELECT user_pw FROM user_Info WHERE user_id = ?");
			pstmt.setString(1, user_id);
			
			
			rs = pstmt.executeQuery();
			
				
			if(rs.next()) {
			
				dbPasswd = rs.getString("user_pw");  //아이디와 일치한 db에 들어있는 비번 값을 dbPasswd에 넣는다.
				if(dbPasswd.equals(user_pw)) {		//내가 입력한 비밀번호와 dbPasswd와 동일하다면...
					
					sql = "DELETE from user_Info "
							+ " WHERE user_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					deleteCount = pstmt.executeUpdate();
					
				}
			}
		}
			
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return deleteCount;
	}

	
	public String selectUserIdName(String user_id, String user_name) {
		// TODO Auto-generated method stub
		String dbUserId = null;
		String dbUserName = null;
		String pwsearchresult = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM user_Info WHERE user_id = ? AND user_name =? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_name);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbUserId = rs.getString("user_id"); 
				dbUserName =rs.getString("user_name");
				
				if(dbUserId.equals(user_id)&&dbUserName.equals(user_name)) {		
					
					sql = "SELECT user_pw from user_Info "
							+ " WHERE user_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, user_id);
					
					pwsearchresult=rs.getString("user_pw");
					
					
				}

				
			}
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pwsearchresult;
	}

	public int updateUserPw(UserVO userVO) {
		
		int updateCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			pstmt = con.prepareStatement(""
					+ "SELECT * FROM user_Info WHERE user_id = ?");
			pstmt.setString(1, userVO.getUser_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			
					sql = " UPDATE user_Info SET user_pw = ?"
							+ " WHERE user_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userVO.getUser_pw());
					pstmt.setString(2, userVO.getUser_id());
					
					updateCount = pstmt.executeUpdate();
					
				}
		}
			
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
	
	
		
		return updateCount;
	}



}
