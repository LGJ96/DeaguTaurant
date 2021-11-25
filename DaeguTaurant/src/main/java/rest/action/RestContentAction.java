package rest.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestContentService;

import vo.ActionForward;

import vo.RestVO;

public class RestContentAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int res_id = Integer.parseInt(request.getParameter("res_id"));
		
		
		RestContentService restContentService = new RestContentService();
		RestVO restVO = restContentService.getRest(res_id);
		


		request.setAttribute("restVO", restVO);
		

		ActionForward forward = new ActionForward();
		forward.setUrl("home_review/rest_content.jsp");
		
		return forward;
	}

}
