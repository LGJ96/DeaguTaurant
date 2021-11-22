package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import Info.action.UserInfoDeleteAction;
import Info.action.UserInfoDeleteProAction;
import Info.action.UserRegistAction;

import login.action.UserIdCheckAction;
import login.action.UserLoginAction;
import login.action.UserLogoutAction;
import login.action.UserNicknameCheckAction;

import vo.ActionForward;

/**
 * Servlet implementation class DaeguTaurantFrontController
 */
@WebServlet("*.dae")
public class DaeguTaurantFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DaeguTaurantFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      String requestURI = request.getRequestURI();
	      //requestURI : /DaeguTaurant/login.dae

	      String contextPath = request.getContextPath();
	      //contextPath : /DaeguTaurant 
	      
	      String command = requestURI.substring(contextPath.length());
	      System.out.println("command = " + command);
			
		
	      Action action = null;
	      ActionForward forward = null;
			
			
			if(command.equals("/login.dae")) {
				action = new UserLoginAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(command.equals("/logout.dae")) {
				action = new UserLogoutAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(command.equals("/userRegist.dae")) {
				action = new UserRegistAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_idCheck.dae")) {
				action = new UserIdCheckAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_nicknameCheck.dae")) {
				action = new UserNicknameCheckAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/user_infoDelete.dae")) {
				action = new UserInfoDeleteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_infoDeletePro.dae")) {
				action = new UserInfoDeleteProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		
		
		
		
		
		
			//3.forward ��ü�� ������ ����ؼ� ������
			if(forward != null) {
				
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getUrl());
				}
				else {
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher(forward.getUrl());
					dispatcher.forward(request, response);
				}
				
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // TODO Auto-generated method stub
         request.setCharacterEncoding("UTF-8");
         doGet(request, response);
      }
}
