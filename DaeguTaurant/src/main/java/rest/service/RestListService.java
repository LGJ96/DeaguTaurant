package rest.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RestDAO;
import vo.RestVO;


public class RestListService {
	


	public ArrayList<RestVO> getRestList() {
		 Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		 
		 ArrayList<RestVO> restList = restDAO.selectRestList();
		 
		return restList;
	}

}
