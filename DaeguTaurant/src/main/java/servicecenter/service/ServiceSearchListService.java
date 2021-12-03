package servicecenter.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.NoticeDAO;
import servicecenter.vo.NoticeVO;

public class ServiceSearchListService {

	public int getSearchCount() {
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		int sea_count = noticeDAO.selectSearchCount();
		close(con);
		return sea_count;
	}
	
	
	
	public List<NoticeVO> getSearchCount(int sea_startRow, int sea_pageSize) {
		
		Connection con = getConnection();
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		List<NoticeVO> articleListt = noticeDAO.selectSearchList(sea_startRow, sea_pageSize);
		close(con);
		
		
		return articleListt;
	}

}
