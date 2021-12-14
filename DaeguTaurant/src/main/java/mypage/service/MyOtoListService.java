package mypage.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OtoDAO;

import servicecenter.vo.OtoVO;
import vo.ReviewVO;

public class MyOtoListService {

	public ArrayList<OtoVO> getMyOtoList(String user_id) {
		
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		ArrayList<OtoVO> myOtoList = otoDAO.selectMyOtoList(user_id);
		 
		return myOtoList;
		
	}


}
