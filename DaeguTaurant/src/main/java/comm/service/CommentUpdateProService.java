package comm.service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import comm.vo.CommentVO;
import dao.CommentDAO;

public class CommentUpdateProService {

	public boolean modifyArticle(CommentVO commentVO) {
		// TODO Auto-generated method stub
		boolean modifySuccess = false;
		Connection con = getConnection();
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.setConnection(con);
		
		int updateCount = commentDAO.updateArticle(commentVO);
		
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
