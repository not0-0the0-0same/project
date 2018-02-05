package utils;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

public class WebUtils {
	//将request中的数据封装到bean中请求中的参数名称要和javabean的属性名一致
	public static <T> T request2Bean(HttpServletRequest request,Class <T> beanClass){
		try {
			T bean = beanClass.newInstance();
			Enumeration e=request.getParameterNames();
			while(e.hasMoreElements()){
				String name=(String)e.nextElement();
				String value=request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}

	//
	public static void copyBean(Object src,Object dest){
		/*
		 private String username;
	private String password;
	private String password2;
	private String email;
	private String birthday;
	private String nickname;
	
	
		private String id;	
	private String username;
	private String password;
	private String email;
	private Date birthday;
	private String nickname;
		 * */




		try {
			BeanUtils.copyProperties(dest, src);//把src属性拷贝到dest属性中
		} catch (Exception e) {
			throw new RuntimeException();
		} 
	}//产生全世界唯一的id
	public static String generateID(){		
		return UUID.randomUUID().toString();
	}

}
