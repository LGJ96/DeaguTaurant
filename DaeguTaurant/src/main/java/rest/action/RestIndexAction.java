package rest.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Info.action.Action;
import rest.service.RestListService;
import vo.ActionForward;
import vo.RestVO;

public class RestIndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
	      RestListService restListService = new RestListService();
	      
	      ArrayList<RestVO> restList = restListService.getRestList();
	  	  //HttpSession session = request.getSession();
	      //session.setAttribute("restList", restList);
	      request.setAttribute("restList", restList);
	      
	     ActionForward forward = new ActionForward();
	      
	      forward.setUrl("home_review/index.jsp");
	    
	      return forward;
	   }


}
