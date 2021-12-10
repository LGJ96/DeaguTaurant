package review.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import review.service.RestReviewService;
import review.service.ReviewListService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewReplyVO;
import vo.ReviewVO;
import vo.UserVO;

public class RestReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int res_id = Integer.parseInt(request.getParameter("res_id"));   //식당고유번호

		// 평점
		//String[] review =request.getParameterValues("rating");
		
		
		 String realFolder = "";//파일이 최종적으로 업로드될 물리적인 경로가 저장될 변수

	      String saveFolder = "/images/rev_pic";//상대경로
	      
	      String encType = "UTF-8";
	      int maxSize = 5*1024*1024; //5mb
	      
	      //서버상에 업로드될 물리적인 경로를 얻어오는 작업
	      ServletContext context = request.getServletContext();//애플리케이션 당 하나씩 할당되는
	      //애플리케이션 전체의 환경설정 정보
	      realFolder = context.getRealPath(saveFolder);
	      
	      MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		           new DefaultFileRenamePolicy());
	     
	      ReviewVO reviewVO = new ReviewVO();
    
	      String fileName = multi.getFilesystemName("rev_pic"); 
			 
	      int index = fileName.indexOf("."); 
			 
	      String fileNameWithoutExt = fileName.substring(0,index);
			
	      reviewVO.setRev_pic(fileNameWithoutExt);
	   
	      String review = multi.getParameter("review"); //평점
	    
			
	      HttpSession session = request.getSession();
	      RestVO restVO = (RestVO)session.getAttribute("restVO");
	      String user_id = multi.getParameter("user_id");

	     
			 UserVO userVO = new UserVO();
			 userVO.setUser_id(multi.getParameter("user_id"));
			 userVO.setUser_nickname(multi.getParameter("user_nickname"));

			
	     
	     // String user_id = request.getParameter("user_id");
	      //System.out.println(user_id);
	     
	      reviewVO.setRes_score(Double.parseDouble(review));
	      reviewVO.setRev_content(multi.getParameter("rev_content"));
	      reviewVO.setRev_like(0);
	      reviewVO.setRev_notice_date(new Timestamp(System.currentTimeMillis()));
	      reviewVO.setRev_id(Integer.parseInt(multi.getParameter("rev_id")));
	      reviewVO.setRev_re_step(Integer.parseInt(multi.getParameter("rev_re_step")));
	      RestReviewService restReviewService = new RestReviewService();
	
	      boolean reviewSuccess = restReviewService.reviewRest(reviewVO,review,restVO,userVO);
	      
	      ActionForward forward = null;
	      if(reviewSuccess) {
	         forward = new ActionForward();
		      session.setAttribute("review", review);
	         forward.setUrl("rest_content.dae?res_id="+restVO.getRes_id());
	         forward.setRedirect(true);
	      }else {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('등록실패')");  //경고창
	         out.println("history.back()");
	         out.println("</script>");
	      }
	      
	         
	      return forward;
	   
	 }
}
