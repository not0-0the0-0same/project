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
		//�޸�request�ı���
		request.setCharacterEncoding("UTF-8");
		//1.�Ϸ���У��  formBean�ѱ����ݷ�װ��formbean
		RegisterForm form=WebUtils.request2Bean(request,RegisterForm.class);
		boolean b=form.validate();
		//2.���У��ʧ�ܣ����ص���ҳ�棬����ʧ����Ϣ
		if(!b){
			request.setAttribute("form", form);//formΪ��װ�Ĵ�����Ϣ
			request.getRequestDispatcher("/WebContent/jsp/register.jsp").forward(request, response);//���������·�����Ƿ�������������Ϣ
			return ;
		}
		
		//3.У��ɹ��������service����ע������
		BusinessServiceImpl service =new BusinessServiceImpl();
		User user=new User();
		WebUtils.copyBean(form, user);
		user.setId(WebUtils.generateID());
		try {
			service.register(user);
			//6.service����ɹ�����ת����վ��ȫ����Ϣ��ʾҳ�棬Ϊ�û���ʾע��ɹ���Ϣ
			request.setAttribute("message","ע�ᣡ����");
			System.out.println("6666666");
			request.getRequestDispatcher("/WebContent/tiaozhuan.jsp").forward(request, response);
			return;
		} catch (UserExistException e) {
			//4.service�����ɹ���ԭ�����û���������ע��ҳ����ʾע���û��Ѵ���
			form.getErrors().put("username", "ע����û��Ѵ���");
			request.setAttribute("form", form);
			request.getRequestDispatcher("/WebContent/jsp/register.jsp").forward(request, response);
			return;
		}catch (Exception e) {
			//5.service�����ɹ���ԭ������������   ����ת��ȫ����Ϣ������棬��ʾ�Ѻô���ҳ��
			e.printStackTrace();
			request.setAttribute("message", "����������δ֪����");
			request.getRequestDispatcher("/WebContent/message.jsp").forward(request, response);
			return;
		}
		
		

		
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}

