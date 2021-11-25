package rest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;

import vo.ReplyVO;

public class RestRegistFormAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int res_id = 0;
		int res_ref = 1;
		int res_Addr1_ref = 1;
		int res_re_step = 0;
		
		if(request.getParameter("res_id") != null) {
			// �亯���̸�
			res_id = Integer.parseInt(request.getParameter("res_id"));
			res_ref = Integer.parseInt(request.getParameter("res_ref"));
			res_Addr1_ref = Integer.parseInt(request.getParameter("res_Addr1_ref"));
			res_re_step = Integer.parseInt(request.getParameter("res_re_step"));
			
		}
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setRes_id(res_id);
		replyVO.setRes_re_step(res_re_step);
		replyVO.setRes_ref(res_ref);
		replyVO.setRes_Addr1_ref(res_Addr1_ref);
		
		request.setAttribute("replyVO", replyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("home_review/restaurant_register.jsp");
		
		return forward;
	}
}
