package web.form;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/*ע���    ע������������*/
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import utils.WebUtils;

public class RegisterForm {
	private String username;
	private String password;
	private String password2;
	private String email;
	private String nickname;
	//��һ��ȥ���������Ϣ
	private Map errors=new HashMap();
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Map getErrors() {
		return errors;
	}

	public void setErrors(Map errors) {
		this.errors = errors;
	}

	public boolean validate(){
		boolean isOk=true;
		//�û�������Ϊ�գ���3-8λ��ĸ
		//���벻�գ�3-8λ����
		//���䲻�գ���һ���Ϸ�����
		//���տ���Ϊ�գ������Ϊ�գ���Ҫ�Ϸ�
		//�ǳ�Ҫ���֣�����Ϊ��
		
		if(username==null || username.trim().equals("")){
			isOk=false;
			errors.put("username","�û�������Ϊ��");
		}else{
			if(!username.matches("[A-Za-z]{3,8}")){
				isOk=false;
				errors.put("username","�û���3-8λ��ĸ");
			}
		}
		
		if(password==null || password.trim().equals("")){
			isOk=false;
			errors.put("password","���벻��Ϊ��");
		}else{
			if(!password.matches("\\d{3,8}")){
				isOk=false;
				errors.put("password","����3-8λ����");
			}
		}
			
		if(password2==null || password2.trim().equals("")){
			isOk=false;
			errors.put("password2","ȷ�����벻��Ϊ��");
		}else{
			if(!password.equals(password2)){
				isOk=false;
				errors.put("password2","�����������벻һ��");
			}
		}
		if(email==null || email.trim().equals("")){
			isOk=false;
			errors.put("email","���䲻��Ϊ��");
		}else{
			if(!email.matches("\\w+@\\w+(\\.\\w+)+")){
				isOk=false;
				errors.put("email","�����ʽ���Ϸ�");
			}
		}
		
	
		if(nickname==null || nickname.trim().equals("")){
			isOk=false;
			errors.put("nickname","�ǳƲ���Ϊ��");	
		}else{//��������  \u4e00-\u9fa5
			if(!nickname.matches("^([\u4e00-\u9fa5]+)$")){
				isOk=false;
				errors.put("nickname","�ǳƱ���Ϊ����");	
			}
		}
		return isOk;
	}

}
