package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestSearchListService;
import rest.service.RestSearchService;
import vo.ActionForward;
import vo.RestVO;

public class RestSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	  	String searchword = request.getParameter("searchword");
	  	
	  	RestSearchService restSearchService = new RestSearchService();
	  	
	  	ArrayList<RestVO> restsearch = restSearchService.getRestSearch();
	  	ArrayList<RestVO> restsearchword = restSearchService.getRestSearchWordList(searchword);
	  	
		HttpSession session = request.getSession();
		session.setAttribute("searchword", searchword);
		session.setAttribute("restsearch", restsearch);
		session.setAttribute("restsearchword", restsearchword);
		  

		ActionForward forward = new ActionForward();
		      
		forward.setUrl("home_review/search.jsp");
		    
		return forward;
		
		
		
		
	}

}
