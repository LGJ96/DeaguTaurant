package rest.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.RestDAO;
import vo.RestVO;

public class RestContentService {
	
	public RestVO getRest(int res_id) throws Exception {
		
		Connection con = getConnection();
	    RestDAO restDAO = RestDAO.getInstance();
	    restDAO.setConnection(con);
		
		RestVO restVO = restDAO.selectRest(res_id);
		close(con);
		return restVO;
	}

}
