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
				request.getSession().setAttribute("user", user);//在session头里带上用户的信息
				response.sendRedirect(request.getContextPath()+"Chat.jsp");//request.getContextPath()拿到的是你的web项目的根路径，就是webRoot
				return;
			}
			request.setAttribute("message", "用户名或密码错误");
			request.getRequestDispatcher("/WebContent/message.jsp").forward(request, response);//getRequestDispatcher拿到的是当前应用的目录
		}


		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request,response);
		}

	}
