package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.NoticeDAO;
import servicecenter.vo.NoticeVO;

public class NoticeUpdateFormService {

	public NoticeVO getArtcticle(int cus_notice_number) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
        NoticeDAO noticeDAO = NoticeDAO.getInstance();
        noticeDAO.setConnection(con);
        
        NoticeVO article = noticeDAO.selectUpdateArticle(cus_notice_number);
        close(con);
     return article;
	}

}
