package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestCheckSearchService;
import vo.ActionForward;
import vo.RestVO;

public class Rest2categoryCheckSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] arealist =request.getParameterValues("area");
		String[] categorylist = request.getParameterValues("category");
				
		RestCheckSearchService restCheckSearchservice = new RestCheckSearchService();
		
		ArrayList<RestVO> rest2categorychecksearch = restCheckSearchservice.getRest2CategoryCheckSearch(categorylist,arealist);


		request.setAttribute("rest2categorychecksearch", rest2categorychecksearch);
	      
	      ActionForward forward = new ActionForward();
	      forward.setUrl("home_review/search.jsp");
	      return forward;
	}

}
