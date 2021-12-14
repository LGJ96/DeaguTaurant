package comm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommListService;
import comm.vo.CommPageVO;
import comm.vo.CommVO;
import vo.ActionForward;

public class CommList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int com_pageSize = 10; 
		String com_pageNum= request.getParameter("com_pageNum");
		if(com_pageNum == null) {
			
			com_pageNum = "1"; 
		}
		
		int com_currentPage = Integer.parseInt(com_pageNum);
		
		int com_startRow = (com_currentPage -1 ) * com_pageSize +1;
		
		int com_count = 0;
		int com_number = 0;
		
		CommListService commListService =  new CommListService();
		List<CommVO> comArticleList = null;
		com_count = commListService.getArticleCount();
		
		if(com_count > 0) {
			comArticleList = commListService.getArticleCount(com_startRow, com_pageSize);
			
		}
		
		com_number = com_count -(com_currentPage -1 )* com_pageSize;
		
		int com_pageCount = 0; 
		int com_startPage = 0;
		int com_endPage = 0;
		
		if(com_count > 0) {
			com_pageCount = com_count / com_pageSize + (com_count % com_pageSize == 0 ? 0 : 1);
			
			com_startPage = (int)((com_currentPage - 1) / 10) * 10 + 1;
			
			com_endPage = com_startPage + 9;
			
			if(com_endPage > com_pageCount) {
				com_endPage = com_pageCount;
				
			}
		}
		
		request.setAttribute("comArticleList", comArticleList);
		CommPageVO commPageVO = new CommPageVO();
			
		commPageVO.setCom_currentPage(com_currentPage);
		commPageVO.setCom_endPage(com_endPage);
		commPageVO.setCom_count(com_count);
		commPageVO.setCom_number(com_number);
		commPageVO.setCom_pageCount(com_pageCount);
		commPageVO.setCom_startPage(com_startPage);
			
		request.setAttribute("commPageVO", commPageVO);
		ActionForward forward = new ActionForward();
		forward.setUrl("comm/comm.jsp");
		return forward;
	}

}
