package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommWriteProService {

	public boolean registArticle(CommVO commVO) throws Exception {
		// TODO Auto-generated method stub
		boolean registSuccess = false;
        Connection con = getConnection();
        CommDAO commDAO = CommDAO.getInstance();
        commDAO.setConnection(con);
        
        int insertCount = commDAO.insertArticle(commVO);
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
