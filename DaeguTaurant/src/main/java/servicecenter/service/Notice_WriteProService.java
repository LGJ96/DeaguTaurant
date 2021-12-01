package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;
import servicecenter.vo.NoticeVO;

public class Notice_WriteProService {

	public boolean registArticle(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		boolean registSuccess = false;
        Connection con = getConnection();
        NoticeDAO noticeDAO = NoticeDAO.getInstance();
        noticeDAO.setConnection(con);
        
        int insertCount = noticeDAO.insertArticle(noticeVO);
        if(insertCount > 0) {
           registSuccess = true;
           commit(con);
        }
        else {
           rollback(con);
        }
        close(con);
        return registSuccess;
     
	}

}
