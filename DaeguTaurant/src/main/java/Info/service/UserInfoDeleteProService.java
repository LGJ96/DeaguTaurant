package Info.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;


public class UserInfoDeleteProService {

	public boolean removeUser_Info(String user_id, String user_pw) {
		boolean infodeleteSuccess = false;
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		int deleteCount = userDAO.deleteUser_Info(user_id,user_pw);
		
		if(deleteCount >0) {
			infodeleteSuccess = true;                 //삭제성공
			commit(con);
		}
		else {
			rollback(con);
		}
		
		return infodeleteSuccess;
	}


}
