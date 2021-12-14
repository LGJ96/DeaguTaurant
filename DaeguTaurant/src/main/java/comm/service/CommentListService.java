package comm.service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import comm.vo.CommentVO;
import dao.CommentDAO;


public class CommentListService {

	public int getArticleCount() throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.setConnection(con);
		
		int articleCount = commentDAO.selectArticleCount();
		close(con);
		return articleCount;
	}

	public List<CommentVO> getArticleCount(int comment_startRow, int comment_pageSize) throws Exception {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.setConnection(con);
		
		List<CommentVO> commentArticleList = commentDAO.selectArticleList(comment_startRow, comment_pageSize);
		close(con);
		
		
		return commentArticleList;
	}
	

}
