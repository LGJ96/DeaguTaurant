package comm.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import comm.service.CommSearchService;
import comm.vo.CommVO;
import vo.ActionForward;

public class CommSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String searchword = request.getParameter("searchword");
	  	
	  	CommSearchService commSearchService = new CommSearchService();
	  	
	  	
	  	ArrayList<CommVO> comsearchword = commSearchService.getComSearchWordList(searchword);
	  	
		HttpSession session = request.getSession();
		session.setAttribute("searchword", searchword);
		session.setAttribute("comsearchword", comsearchword);
		  

		ActionForward forward = new ActionForward();
		      
		forward.setUrl("comm/comm-search.jsp");
		    
		return forward;
	}

}
