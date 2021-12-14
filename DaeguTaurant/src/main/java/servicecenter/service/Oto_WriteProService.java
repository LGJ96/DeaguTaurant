package servicecenter.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.OtoDAO;
import servicecenter.vo.OtoVO;
import vo.UserVO;

public class Oto_WriteProService {

	public boolean registArticle(OtoVO otoVO, UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
				boolean registSuccess = false;
		        Connection con = getConnection();
		        OtoDAO otoDAO = OtoDAO.getInstance();
		        otoDAO.setConnection(con);
		        
		        int insertCount = otoDAO.insertArticle(otoVO, userVO);
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
