package web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import exception.UserExistException;
import service.BusinessServiceImpl;
import utils.WebUtils;
import web.form.RegisterForm;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("6666666");
		//修改request的编码
		request.setCharacterEncoding("UTF-8");
		//1.合法性校验  formBean把表单数据封装到formbean
		RegisterForm form=WebUtils.request2Bean(request,RegisterForm.class);
		boolean b=form.validate();
		//2.如果校验失败，跳回到表单页面，回显失败消息
		if(!b){
			request.setAttribute("form", form);//form为封装的错误信息
			request.getRequestDispatcher("/WebContent/jsp/register.jsp").forward(request, response);//不能是相对路径，是服务器负责发送信息
			return ;
		}
		
		//3.校验成功，则调用service处理注册请求
		BusinessServiceImpl service =new BusinessServiceImpl();
		User user=new User();
		WebUtils.copyBean(form, user);
		user.setId(WebUtils.generateID());
		try {
			service.register(user);
			//6.service处理成功，跳转到网站的全局消息显示页面，为用户显示注册成功消息
			request.setAttribute("message","注册！！！");
			System.out.println("6666666");
			request.getRequestDispatcher("/WebContent/tiaozhuan.jsp").forward(request, response);
			return;
		} catch (UserExistException e) {
			//4.service处理不成功，原因是用户存在跳回注册页面显示注册用户已存在
			form.getErrors().put("username", "注册的用户已存在");
			request.setAttribute("form", form);
			request.getRequestDispatcher("/WebContent/jsp/register.jsp").forward(request, response);
			return;
		}catch (Exception e) {
			//5.service处理不成功，原因是其他问题   ，跳转到全局消息处理界面，显示友好错误页面
			e.printStackTrace();
			request.setAttribute("message", "服务器出现未知错误");
			request.getRequestDispatcher("/WebContent/message.jsp").forward(request, response);
			return;
		}
		
		

		
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}

