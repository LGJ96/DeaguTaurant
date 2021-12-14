package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommentVO;
import dao.CommentDAO;

public class CommentWriteProService {

	public boolean registArticle(CommentVO commentVO) throws Exception {
		// TODO Auto-generated method stub
		boolean registSuccess = false;
        Connection con = getConnection();
        CommentDAO commentDAO = CommentDAO.getInstance();
        commentDAO.setConnection(con);
        
        int insertCount = commentDAO.insertArticle(commentVO);
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
