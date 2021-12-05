package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestCheckSearchService;
import vo.ActionForward;
import vo.RestVO;

public class Rest3areaCheckSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String[] arealist =request.getParameterValues("area");
		String[] categorylist = request.getParameterValues("category");
				
		RestCheckSearchService restCheckSearchservice = new RestCheckSearchService();
		
		ArrayList<RestVO> rest3areachecksearch = restCheckSearchservice.getRest3AreaCheckSearch(arealist,categorylist);


		
		request.setAttribute("rest3areachecksearch", rest3areachecksearch);
	      
	      ActionForward forward = new ActionForward();
	      forward.setUrl("home_review/search.jsp");
	      return forward;
	}

}
