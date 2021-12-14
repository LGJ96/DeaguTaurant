package comm.service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import comm.vo.CommVO;
import dao.CommDAO;

public class CommUpdateFormService {

	public CommVO getArtcticle(int com_number) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
        CommDAO commDAO = CommDAO.getInstance();
        commDAO.setConnection(con);
        
        CommVO comArticle = commDAO.selectUpdateArticle(com_number);
        close(con);
     return comArticle;
	}

}
