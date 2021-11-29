package rest.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RestDAO;
import vo.RestVO;

public class RestListSearchService {

	public ArrayList<RestVO> getRestSearchList() {
		 Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		
	     ArrayList<RestVO> restList = restDAO.selectRestList();
	    
		
		return restList;
	}

	public ArrayList<RestVO> getRestSearchWordList(int res_id,String searchword) {
		 Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		
	     ArrayList<RestVO> restwordList = restDAO.selectResWordtList(res_id,searchword);
	    
		
		return restwordList;
	}

}
