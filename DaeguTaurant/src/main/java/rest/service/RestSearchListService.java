package rest.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RestDAO;
import vo.RestVO;

public class RestSearchListService {

	public ArrayList<RestVO> getRestSearchList() {
		 Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		
	     ArrayList<RestVO> restsearchList = restDAO.selectRestSearchList();
	    
		
		return restsearchList;
	}

	public ArrayList<RestVO> getRestSearchWordList(String searchword) {
		 Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
	     ArrayList<RestVO> restsearchword = restDAO.selectResWordtList(searchword);
	    
		return restsearchword;
	}

}
