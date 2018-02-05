package service;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import domain.User;
import exception.UserExistException;
import utils.ServiceUtils;

//6  ��web���ṩ���е�ҵ�����
public class BusinessServiceImpl {

	private UserDao dao=new UserDaoImpl();//����ģʽ   spring
	//��web���ṩע�����
	public void register(User user) throws UserExistException{
		boolean b=dao.find(user.getUsername());
		if(b){
			throw new UserExistException("�û��Ѿ����ڣ�");
			//�û����ڣ���web���׳�����ʱ�쳣
		}else{
			user.setPassword(ServiceUtils.md5(user.getPassword()));
			dao.add(user);
		}
	}
	//��web���ṩ��¼����
	public User login(String username,String password){
		password=ServiceUtils.md5(password);
		return dao.find(username, password);
	}
	
}
