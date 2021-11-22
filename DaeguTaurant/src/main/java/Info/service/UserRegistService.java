package Info.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserVO;



public class UserRegistService {


	public boolean registUser(UserVO userVO) {
		
		boolean registSuccess = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		int insertCount = userDAO.insertUser(userVO);
		if(insertCount > 0) {
			
			registSuccess = true;
			commit(con);
		}
		else {
			
			rollback(con);
		}
		close(con);
		return registSuccess;
	}
	
}
