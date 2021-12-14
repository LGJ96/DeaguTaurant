package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.CommDAO;


public class CommDeleteProService {

	public boolean deleteArticle(int com_number) {
		// TODO Auto-generated method stub
		boolean deleteSuccess = false;
		Connection con = getConnection();
        CommDAO commDAO = CommDAO.getInstance();
        commDAO.setConnection(con);
        
        int deleteCount = commDAO.deleteArticle(com_number);
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
