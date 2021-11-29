package rest.service;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.RestDAO;
import vo.RestVO;


public class RestUpdateService {

	

	public RestVO getUpdateRestArticle(int res_id) throws Exception{
		Connection con = getConnection();
		RestDAO restDAO = RestDAO.getInstance();
		restDAO.setConnection(con);
		
		RestVO restarticle = restDAO.selectUpdateRestArticle(res_id);
		close(con);
		return restarticle;
	}

}
