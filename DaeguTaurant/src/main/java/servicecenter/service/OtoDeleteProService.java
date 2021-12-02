package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.OtoDAO;

public class OtoDeleteProService {

	public boolean deleteArticle(int cus_oto_number) throws Exception {
		// TODO Auto-generated method stub
		boolean deleteSuccess = false;
		Connection con = getConnection();
        OtoDAO otoDAO = OtoDAO.getInstance();
        otoDAO.setConnection(con);
        
        int deleteCount = otoDAO.deleteArticle(cus_oto_number);
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
