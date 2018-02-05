package model;

import java.util.LinkedList;


public class ChatService {
	static LinkedList<String> messages = new LinkedList<String>();

	public static String getMessage() {
		String str="";
		for(String s:messages)
			str+=s+"\n";
		
		return str;
	}
	
	public static void addMessage(String msg){
		messages.add(msg);
	}
	
	
}
