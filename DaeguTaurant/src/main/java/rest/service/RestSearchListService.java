package rest.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.RestDAO;
import vo.RestVO;

public class RestSearchListService {


	public int getRestCount() throws Exception {
		Connection con = getConnection();
		RestDAO restDAO = RestDAO.getInstance();
		restDAO.setConnection(con);
		 
		int restCount = restDAO.selectRestCount();
		close(con);
			
		return restCount;
	
	}

	
	public List<RestVO> getRestCountList(int rest_startRow, int rest_pageSize) throws Exception {
		
	
		Connection con = getConnection();
		RestDAO restDAO = RestDAO.getInstance();
		restDAO.setConnection(con);
		
		List<RestVO> restListt = restDAO.selectRestCountList(rest_startRow, rest_pageSize);
		close(con);
		
		return restListt;
	}

}
