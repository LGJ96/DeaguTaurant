package mypage.service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserVO;

public class PwUpdateProService {

	public boolean modifyPw(UserVO userVO) {
		
		boolean modifySuccess = false;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		int updateCount = userDAO.updateUserPw(userVO);
		
		if(updateCount >0) {
			modifySuccess = true;                 //삭제성공
			commit(con);
		}
		else {
			rollback(con);
		}
		
		return modifySuccess;
	
		
		
		
	
	}

}
