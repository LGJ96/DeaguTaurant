package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.CommentDAO;


public class CommentDeleteProService {

	public boolean deleteArticle(int comment_number) throws Exception {
		// TODO Auto-generated method stub
		boolean deleteSuccess = false;
		Connection con = getConnection();
        CommentDAO commentDAO = CommentDAO.getInstance();
        commentDAO.setConnection(con);
        
        int deleteCount = commentDAO.deleteArticle(comment_number);
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
