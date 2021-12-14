package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommentVO;
import dao.CommentDAO;

public class CommentUpdateFormService {

	public CommentVO getArtcticle(int comment_number) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
        CommentDAO commentDAO = CommentDAO.getInstance();
        commentDAO.setConnection(con);
        
        CommentVO commentArticle = commentDAO.selectUpdateArticle(comment_number);
        close(con);
     return commentArticle;
	}

}
