package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestSearchListService;
import vo.ActionForward;
import vo.RestVO;

public class RestSearchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   	String searchword = request.getParameter("searchword");
		   
		   	RestSearchListService restListSearchService = new RestSearchListService();
		   
	
		      ArrayList<RestVO> restsearchList = restListSearchService.getRestSearchList();
		      ArrayList<RestVO> restsearchword = restListSearchService.getRestSearchWordList(searchword);
		  	  HttpSession session = request.getSession();
		      session.setAttribute("searchword", searchword);
		      session.setAttribute("restsearchList", restsearchList);
		      session.setAttribute("restsearchword", restsearchword);
		     
		     ActionForward forward = new ActionForward();
		      
		      forward.setUrl("home_review/search.jsp");
		    
		      return forward;
	}

}
