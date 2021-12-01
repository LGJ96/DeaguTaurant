package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import dao.NoticeDAO;
import servicecenter.vo.NoticeVO;

public class ServiceCenterListService {

	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		int articleCount = noticeDAO.selectArticleCount();
		close(con);
		return articleCount;
	}

	public List<NoticeVO> getArticleCount(int startRow, int pageSize) throws Exception {
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		List<NoticeVO> articleList = noticeDAO.selectArticleList(startRow, pageSize);
		close(con);
		
		
		return articleList;
	
	}
	
	

}
