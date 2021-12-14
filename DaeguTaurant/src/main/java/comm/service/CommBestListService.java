package comm.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommBestListService {

	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		int articleCount = commDAO.selectArticleCount();
		close(con);
		return articleCount;
	}

	public List<CommVO> getArticleCount(int com_startRow, int com_pageSize) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommDAO commDAO = CommDAO.getInstance();
		commDAO.setConnection(con);
		
		List<CommVO> comArticleBestList = commDAO.selectArticBestList(com_startRow, com_pageSize);
		close(con);
		
		
		return comArticleBestList;
	}
	
}
