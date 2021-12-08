package rest.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestContentService;
import review.service.ReviewListService;
import vo.ActionForward;
import vo.RestPageVO;
import vo.RestVO;
import vo.ReviewVO;

public class RestContentAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int res_id = Integer.parseInt(request.getParameter("res_id"));   //식당고유번호
		String user_id = request.getParameter("user_id");
		
		int rest_pageSize = 10; //�� �������� ��µǴ� ���� ����
		String rest_pageNum = request.getParameter("rest_pageNum");
		if(rest_pageNum==null) {
			rest_pageNum = "1";
		}
		
		int rest_currentPage = Integer.parseInt(rest_pageNum);
		
		int rest_startRow =(rest_currentPage -1)*rest_pageSize +1;
		
		
		int rest_count = 0; 
		int rest_number = 0; 
		

		RestContentService restContentService = new RestContentService(); //내용
		RestVO restVO = restContentService.getRest(res_id);
		
		ReviewVO reviewVO = new ReviewVO();

		
		ReviewListService reviewListService = new ReviewListService();	//리뷰
		List<ReviewVO> reviewList = null;
		rest_count = reviewListService.getReviewCount(res_id);          //리뷰 수
		
		double totalScore=reviewListService.getTotalScore(res_id);
		
		if(rest_count > 0) {
			reviewList = reviewListService.getReviewList(rest_startRow,rest_pageSize,res_id,reviewVO);
		}
		rest_number = rest_count -(rest_currentPage - 1) * rest_pageSize;
		
		
		//����¡ó��
		int rest_pageCount = 0; 
		int rest_startPage = 0; 
		int rest_endPage = 0;
		
		if(rest_count > 0) {
			rest_pageCount = rest_count / rest_pageSize + (rest_count % rest_pageSize == 0 ? 0 : 1);
			
			
			rest_startPage = (int)((rest_currentPage - 1 )/10)*10+1;
		
			
			rest_endPage = rest_startPage + 9;
			
			if(rest_endPage>rest_pageCount) {
				rest_endPage = rest_pageCount;
			}
		}
			RestPageVO restpageVO = new RestPageVO();
			restpageVO.setRest_count(rest_count);
			restpageVO.setRest_currentPage(rest_currentPage);
			restpageVO.setRest_endPage(rest_endPage);
			restpageVO.setRest_number(rest_number);
			restpageVO.setRest_pageCount(rest_pageCount);
			restpageVO.setRest_startPage(rest_startPage);
			
		HttpSession session = request.getSession();
		
		session.setAttribute("reviewList", reviewList);
		session.setAttribute("restpageVO", restpageVO);
		session.setAttribute("restVO", restVO);
		session.setAttribute("totalScore", totalScore);
		session.setAttribute("user_id", user_id);
		
		

		ActionForward forward = new ActionForward();
		forward.setUrl("home_review/rest_content.jsp");
		
		return forward;
	}

}
