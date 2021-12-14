package comm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.vo.CommReplyVO;
import vo.ActionForward;

public class Comm_writeFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int com_number = 0;
		if(request.getParameter("com_number") !=null) {
			com_number = Integer.parseInt(request.getParameter("com_number"));
			
		}
		
		CommReplyVO commReplyVO = new CommReplyVO();
		commReplyVO.setCom_number(com_number);
		
		
		request.setAttribute("commReplyVO", commReplyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("comm/comm-write.jsp");
		return forward;
	}

}
