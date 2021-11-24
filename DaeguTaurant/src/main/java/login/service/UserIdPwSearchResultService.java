package login.service;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.UserDAO;

public class UserIdPwSearchResultService {

	public String existUserIdName(String user_id, String user_name) {
		// TODO Auto-generated method stub
				
				Connection con = getConnection();
				UserDAO userDAO = UserDAO.getInstance();
				userDAO.setConnection(con);
				
				String pwsearchresult = userDAO.selectUserIdName(user_id,user_name);
				
			
				return pwsearchresult;
			}

}
