package rest.service;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.RestDAO;
import vo.RestVO;

public class RestCheckSearchService {

	//각 지역 각 테마
	public ArrayList<RestVO> getRest1EachCheckSearch(String area, String category) {
		Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		 
		 ArrayList<RestVO> rest1eachchecksearch = restDAO.selectRest1eachCheckSearch(area,category);

		return rest1eachchecksearch;
	}
// 3개의 지역 선택 가능
	public ArrayList<RestVO> getRest3AreaCheckSearch(String[] arealist, String[] categorylist) throws Exception {
		Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		 
		 ArrayList<RestVO> rest3areachecksearch = restDAO.selectRest3areaCheckSearch(arealist,categorylist);
		
		return rest3areachecksearch;
	}
	//테마 2
	public ArrayList<RestVO> getRest2CategoryCheckSearch(String[] categorylist, String[] arealist) {
		Connection con = getConnection();
		 RestDAO restDAO = RestDAO.getInstance();
		 restDAO.setConnection(con);
		 
		 ArrayList<RestVO> rest2categorychecksearch = restDAO.selectRest2categoryCheckSearch(categorylist,arealist);
		
		return rest2categorychecksearch;
	}


}
