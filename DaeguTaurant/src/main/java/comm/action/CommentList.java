package comm.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import comm.service.CommentListService;
import comm.vo.CommentPageVO;
import comm.vo.CommentVO;
import vo.ActionForward;

public class CommentList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int comment_pageSize = 10; 
		String comment_pageNum= request.getParameter("comment_pageNum");
		if(comment_pageNum == null) {
			
			comment_pageNum = "1"; 
		}
		
		int comment_currentPage = Integer.parseInt(comment_pageNum);
		
		int comment_startRow = (comment_currentPage -1 ) * comment_pageSize +1;
		
		int comment_count = 0;
		int comment_number = 0;
		
		CommentListService commentListService =  new CommentListService();
		List<CommentVO> commentArticleList = null;
		comment_count = commentListService.getArticleCount();
		
		if(comment_count > 0) {
			commentArticleList = commentListService.getArticleCount(comment_startRow, comment_pageSize);
			
		}
		
		comment_number = comment_count -(comment_currentPage -1 )* comment_pageSize;
		
		int comment_pageCount = 0; 
		int comment_startPage = 0;
		int comment_endPage = 0;
		
		if(comment_count > 0) {
			comment_pageCount = comment_count / comment_pageSize + (comment_count % comment_pageSize == 0 ? 0 : 1);
			
			comment_startPage = (int)((comment_currentPage - 1) / 10) * 10 + 1;
			
			comment_endPage = comment_startPage + 9;
			
			if(comment_endPage > comment_pageCount) {
				comment_endPage = comment_pageCount;
				
			}
		}
		
		request.setAttribute("commentArticleList", commentArticleList);
		CommentPageVO commentPageVO = new CommentPageVO();
			
		commentPageVO.setComment_currentPage(comment_currentPage);
		commentPageVO.setComment_endPage(comment_endPage);
		commentPageVO.setComment_count(comment_count);
		commentPageVO.setComment_number(comment_number);
		commentPageVO.setComment_pageCount(comment_pageCount);
		commentPageVO.setComment_startPage(comment_startPage);
			
		request.setAttribute("commentPageVO", commentPageVO);
		ActionForward forward = new ActionForward();
		/* forward.setUrl("comm/comm_content.jsp"); */
		forward.setUrl("comment_writeForm.dae?com_number="+request.getParameter("com_number")+"&"+"com_pageNum="+request.getParameter("com_pageNum"));
		return forward;
	}

}
