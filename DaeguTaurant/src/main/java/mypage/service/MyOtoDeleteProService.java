package mypage.service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.OtoDAO;


public class MyOtoDeleteProService {

	public boolean removeMyOto(int cus_oto_number, String user_id) {
		
		boolean myOtodeleteSuccess = false;
		Connection con = getConnection();
		OtoDAO otoDAO = OtoDAO.getInstance();
		otoDAO.setConnection(con);
		
		int deleteCount = otoDAO.deleteMyOto(cus_oto_number,user_id);
		
		if(deleteCount >0) {
			myOtodeleteSuccess = true;                 //삭제성공
			commit(con);
		}
		else {
			rollback(con);
		}
		
		return myOtodeleteSuccess;
	}


}
