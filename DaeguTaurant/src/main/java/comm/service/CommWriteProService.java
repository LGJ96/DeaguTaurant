package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommVO;
import dao.CommDAO;
import vo.UserVO;

public class CommWriteProService {

	public boolean registArticle(CommVO commVO, UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		boolean registSuccess = false;
        Connection con = getConnection();
        CommDAO commDAO = CommDAO.getInstance();
        commDAO.setConnection(con);
        
        int insertCount = commDAO.insertArticle(commVO, userVO);
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
