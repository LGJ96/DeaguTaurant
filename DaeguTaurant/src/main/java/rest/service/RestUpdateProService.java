package rest.service;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.RestDAO;
import vo.RestVO;

public class RestUpdateProService {

	public boolean modifyRestArticle(RestVO restVO) {
		boolean modifySuccess = false;
		Connection con = getConnection();
	    RestDAO restDAO = RestDAO.getInstance();
	    restDAO.setConnection(con);
		
		int updateCount = restDAO.updateRestArticle(restVO);
		
		if(updateCount>0) {
			commit(con);
			modifySuccess = true;
		}
		else {
			rollback(con);
		}
		

		return modifySuccess;
	}

}
