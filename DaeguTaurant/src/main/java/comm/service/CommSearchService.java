package comm.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommSearchService {

	public ArrayList<CommVO> getComSearchWordList(String searchword) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		 CommDAO commDAO = CommDAO.getInstance();
		 commDAO.setConnection(con);
	     ArrayList<CommVO> comsearchword = commDAO.selectComWordList(searchword);
	    
		return comsearchword;
	}

}
