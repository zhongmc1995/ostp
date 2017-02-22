package com.peace.ostp.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/websocket",configurator=GetHttpSessionConfigurator.class)
public class ChatServlet {

	//private static final CopyOnWriteMap<HttpSession,ChatServlet> onlineUsers = new CopyOnWriteMap<HttpSession, ChatServlet>();//当前在线用户

	private static final Set<ChatServlet> onlineUsers = new CopyOnWriteArraySet<ChatServlet>();
	
	private HttpSession httpSession;

	private Session session;


	@OnOpen
	public void onOpen(Session session,EndpointConfig config){
		this.session = session;
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		onlineUsers.add(this);
		String names = getNames();
		if((names!="")){
			String content = MessageUtil.sendContent(MessageUtil.USER,names);
			broadcastAll(content);
		}
		System.out.println("有新连接加入!当前在线人数为" + onlineUsers.size());
	}

	@OnClose
	public void onClose(){
		onlineUsers.remove(this);  //从set中删除  
		/**
		 * 将信息推送到在线用户的用户列表
		 */
		String names = getNames();
		if(onlineUsers.size()>0){
			String content = MessageUtil.sendContent(MessageUtil.USER,names);
			broadcastAll(content);
		}
		System.out.println("有一连接关闭！当前在线人数为" + onlineUsers.size());
	}

	@OnMessage
	public void onMessage(String message, Session session){
			HashMap<String,String> messageMap = MessageUtil.getMessage(message);    //处理消息类
			String fromName = messageMap.get("fromName");    //消息来自人 的userId
			String toName = messageMap.get("toName");       //消息发往人的 userId
			String mapContent = messageMap.get("content");
			String time = messageMap.get("time");
			if(onlineUsers.size()<2)return;//判断是否在线
			//"|"是分隔符，用于前台处理
			String msgContentString = fromName + "|" + mapContent+"|"+time;   //构造发送的消息
			if("all".equals(toName)){	
				String content = MessageUtil.sendContent(MessageUtil.MESSAGE,msgContentString);
				broadcastAll(content);		
			}else{
				String content = MessageUtil.sendContent(MessageUtil.MESSAGE,msgContentString);
				try {
					singleChat(fromName,toName,content);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println("来自客户端的消息:" + message);
	}

	private void singleChat(String fromName, String toName, String mapContent)throws IOException {
		boolean isExit = false;
		for (ChatServlet key : onlineUsers) {
			if(key.httpSession.getAttribute("user").equals(toName)){
				isExit = true;
			}
		}
		if(isExit){
			for (ChatServlet key : onlineUsers) {
				
				if(key.httpSession.getAttribute("user").equals(fromName) || key.httpSession.getAttribute("user").equals(toName)){		
					
					key.session.getBasicRemote().sendText(mapContent);	
					
				}
			}
		}else{
			String content = MessageUtil.sendContent(MessageUtil.MESSAGE,"用户不在线。。。");
			broadcastAll(content);
		}
	}
	
	private static void broadcastAll(String msg) {
		System.out.println(msg);
		if(onlineUsers.size()>0)
		for (ChatServlet key : onlineUsers) {
			try {
                synchronized (key) {
                		key.session.getBasicRemote().sendText(msg);       
                }
            } catch (IOException e) {
            	onlineUsers.remove(key);
                    try {
						key.session.close();
					} catch (IOException e1) {
							//Ignore
						}
					}
		    }
	}

	@OnError
	public void onError(Session session, Throwable error){
		System.out.println("发生错误");
		//error.printStackTrace();
		System.out.println("自我修复中.......");
		if(session.isOpen()){
		    onClose();//手动关闭连接，保证服务器端安全性
		}
	}
	
	private String getNames() {
		String names = "";
		if(onlineUsers.size()>0){
			for (ChatServlet key : onlineUsers) {
				String name = (String) key.httpSession.getAttribute("user");
				names += name + ",";
			}
			String namesTemp = names.substring(0,names.length()-1);
			return namesTemp;
		}
		return names;
	}
}