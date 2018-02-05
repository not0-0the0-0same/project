package web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.BusinessServiceImpl;

	public class LoginServlet extends HttpServlet {

		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			System.out.println("hhhh");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			BusinessServiceImpl service  =new BusinessServiceImpl();
			User user=service.login(username, password);
			if(user!=null){
				request.getSession().setAttribute("user", user);//��sessionͷ������û�����Ϣ
				response.sendRedirect(request.getContextPath()+"Chat.jsp");//request.getContextPath()�õ��������web��Ŀ�ĸ�·��������webRoot
				return;
			}
			request.setAttribute("message", "�û������������");
			request.getRequestDispatcher("/WebContent/message.jsp").forward(request, response);//getRequestDispatcher�õ����ǵ�ǰӦ�õ�Ŀ¼
		}


		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request,response);
		}

	}
