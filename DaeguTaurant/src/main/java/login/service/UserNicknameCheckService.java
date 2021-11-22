package login.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.UserDAO;

public class UserNicknameCheckService {
	
	public boolean existUserNickname(String user_nickname) {
		// TODO Auto-generated method stub
		boolean user_nicknameExist = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		String dbUserNickname = userDAO.selectUserNickname(user_nickname);
		if(dbUserNickname != null) {
			user_nicknameExist = true;
		}
		close(con);
		
		return user_nicknameExist;
	}
}
