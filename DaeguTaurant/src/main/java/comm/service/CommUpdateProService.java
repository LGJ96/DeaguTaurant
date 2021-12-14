package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommUpdateProService {

	public boolean modifyArticle(CommVO commVO) {
		// TODO Auto-generated method stub
		boolean modifySuccess = false;
		Connection con = getConnection();
		CommDAO  commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		int updateCount = commDAO.updateArticle(commVO);
		
		if(updateCount > 0) {
			commit(con);
			modifySuccess = true;
		}
		else {
			rollback(con);
		}
		return modifySuccess;
	}

}
