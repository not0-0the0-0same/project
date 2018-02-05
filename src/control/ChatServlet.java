package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		
		request.setCharacterEncoding("UTF-8");
		String user = request.getParameter("user");
		String msg= request.getParameter("chatMsg");
		if(msg!=null && user!=null)
		{
			model.ChatService.addMessage(user+"˵:"+msg);
		}
		response.setContentType("text/heml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(model.ChatService.getMessage());
		
	
	}
	
}
