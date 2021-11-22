package login.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;

public class UserIdCheckService {
	
	public boolean existUserId(String user_id) {
		// TODO Auto-generated method stub
		boolean user_idExist = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		String dbUserId = userDAO.selectUserId(user_id);
		if(dbUserId != null) {
			user_idExist = true;
		}
		close(con);
		
		return user_idExist;
	}
	
	
	
	

}
