package rest.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestUpdateProService;
import vo.ActionForward;
import vo.RestVO;

public class RestUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				RestVO restVO = new RestVO();
				restVO.setRes_id(Integer.parseInt(request.getParameter("res_id")));
				restVO.setRes_name(request.getParameter("res_name"));
				restVO.setRes_Addr1(request.getParameter("res_Addr1"));
				restVO.setRes_category(request.getParameter("res_category"));
				restVO.setRes_mainmenu(request.getParameter("res_mainmenu"));
				restVO.setRes_readcount(0);
				restVO.setRes_notice_date(new Timestamp(System.currentTimeMillis()));
				restVO.setRes_number(request.getParameter("res_number"));
				restVO.setRes_Addr2(request.getParameter("res_Addr2"));
				restVO.setRes_hours(request.getParameter("res_hours"));
				//restVO.setRes_pic(request.getParameter("res_pic"));
				
				
				RestUpdateProService restUpdateproService = new RestUpdateProService();
				
				boolean modifySuccess =restUpdateproService.modifyRestArticle(restVO);
				
				ActionForward forward = null;
				if(modifySuccess) {
					forward = new ActionForward();
					
					/*forward.setUrl("home_review/index.jsp");*/
					forward.setUrl("rest_content.dae?res_id="+request.getParameter("res_id"));
					
					forward.setRedirect(true);
				}
				else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('수정실패')");
					out.println("history.back();");
					out.println("</script>");
				}
			
				return forward;
			}

}
