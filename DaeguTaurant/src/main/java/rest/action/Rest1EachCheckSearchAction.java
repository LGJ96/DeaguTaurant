package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestCheckSearchService;
import vo.ActionForward;
import vo.RestVO;

public class Rest1EachCheckSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String area = request.getParameter("area");
		String category = request.getParameter("category");

		
		RestCheckSearchService restCheckSearchservice = new RestCheckSearchService();
		ArrayList<RestVO> rest1eachchecksearch = restCheckSearchservice.getRest1EachCheckSearch(area,category);
		
		
	    request.setAttribute("rest1eachchecksearch", rest1eachchecksearch);
	  

	      ActionForward forward = new ActionForward();
	      forward.setUrl("home_review/search.jsp");
	      return forward;
	}

}
