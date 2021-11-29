package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import rest.service.RestListService;
import rest.service.RestListSearchService;
import vo.ActionForward;
import vo.RestVO;

public class RestSearchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RestListSearchService restListSearchService = new RestListSearchService();
		   	String searchword = (String) request.getAttribute("searchword");
			int res_id = Integer.parseInt(request.getParameter("res_id"));
		   
		   
		      ArrayList<RestVO> restsearchList = restListSearchService.getRestSearchList();
		      ArrayList<RestVO> restsearchword = restListSearchService.getRestSearchWordList(res_id,searchword);
		  	  //HttpSession session = request.getSession();
		      //session.setAttribute("restList", restList);
		      request.setAttribute("restsearchList", restsearchList);
		      request.setAttribute("restsearchword", restsearchword);
		      
		     ActionForward forward = new ActionForward();
		      
		      forward.setUrl("home_review/search.jsp");
		    
		      return forward;
	}

}
