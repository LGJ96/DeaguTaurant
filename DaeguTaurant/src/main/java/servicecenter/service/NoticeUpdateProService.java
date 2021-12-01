package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;
import servicecenter.vo.NoticeVO;

public class NoticeUpdateProService {

	public boolean modifyArticle(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		boolean modifySuccess = false;
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		int updateCount = noticeDAO.updateArticle(noticeVO);
		
		if(updateCount > 0) {
			commit(con);
			modifySuccess = true;
		}
		else {
			rollback(con);
		}
		return modifySuccess;
	}

}
