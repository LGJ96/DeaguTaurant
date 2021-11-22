package login.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserVO;

public class LoginService {

	public UserVO getLoginUser(String user_id, String user_pw, String user_nickname) throws Exception{
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		UserVO loginUser = userDAO.selectLoginUser(user_id,user_pw,user_nickname);
		close(con);
		
		return loginUser;
	}

	

}
