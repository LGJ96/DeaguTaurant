package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;

public class NoticeDeleteProService {

	public boolean deleteArticle(int cus_notice_number) throws Exception {
		// TODO Auto-generated method stub
		boolean deleteSuccess = false;
		Connection con = getConnection();
        NoticeDAO noticeDAO = NoticeDAO.getInstance();
        noticeDAO.setConnection(con);
        
        int deleteCount = noticeDAO.deleteArticle(cus_notice_number);
        if(deleteCount > 0) {
           deleteSuccess = true;
           commit(con);
        }
        else {
           rollback(con);
        }      
        close(con);
		return deleteSuccess;
	}

}
