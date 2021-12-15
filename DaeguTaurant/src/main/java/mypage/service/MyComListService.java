package mypage.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import comm.vo.CommVO;
import dao.CommDAO;

public class MyComListService {

	public ArrayList<CommVO> getMyComList(String user_id) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		ArrayList<CommVO> myComList = commDAO.selectMyComList(user_id);
		 
		return myComList;
	}

}
