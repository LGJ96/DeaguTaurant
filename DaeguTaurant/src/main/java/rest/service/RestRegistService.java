package rest.service;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.RestDAO;
import vo.RestVO;



public class RestRegistService {
	
	
	public boolean registRest(RestVO restVO) throws Exception {

		 boolean registSuccess = false;
		 Connection con = getConnection();
	     RestDAO restDAO = RestDAO.getInstance();
	     restDAO.setConnection(con);
		
	     int insertCount = restDAO.insertRest(restVO);
	     if(insertCount > 0 ) {
	    	 registSuccess = true;
	    	 commit(con);
	    	 
	     }
	     else {
	    	 
	    	 rollback(con);
	     }
		return registSuccess;
	}
	

}
