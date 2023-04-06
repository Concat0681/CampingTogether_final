package kr.or.iei.message.model.service;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


public class MessageHandler extends TextWebSocketHandler {
	//���� �ǽð��˸��� ������ ȸ���� ������ Map(key:id, value : ���� ����)
	private HashMap<String, WebSocketSession> connectionMemberList;
	
	@Autowired
	private MessageService service;
	
	public MessageHandler() {
		super();
		connectionMemberList = new HashMap<String, WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String receiveMsg = message.getPayload();
		System.out.println("Ŭ���̾�Ʈ ���� �޼���: "+receiveMsg);
		/*
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(receiveMsg);
		*/
		JsonElement element = JsonParser.parseString(receiveMsg);
		String type= element.getAsJsonObject().get("type").getAsString();
		if(type.equals("enter")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			//���������̹Ƿ� ������ ȸ���� ���̵� map�� �߰�
			connectionMemberList.put(memberId, session);
			//���� ���� ���� ������ ��ȸ�ؼ� �ǵ�����
			int messageCount = service.selectMessageCount(memberId);
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "myMessageCount");
			obj.addProperty("messageCount", messageCount);
			String resultStr = new Gson().toJson(obj);
			TextMessage tm = new TextMessage(resultStr);
			session.sendMessage(tm);
		}else if(type.equals("sendDm")) {
			String memberId = element.getAsJsonObject().get("receiver").getAsString();
			WebSocketSession receiver = connectionMemberList.get(memberId);
			if(receiver != null) {
				int messageCount = service.selectMessageCount(memberId);	
				JsonObject obj = new JsonObject();
				obj.addProperty("type", "myMessageCount");
				obj.addProperty("messageCount", messageCount);
				String resultStr = new Gson().toJson(obj);
				TextMessage tm = new TextMessage(resultStr);
				receiver.sendMessage(tm);
			
			}
		}else if(type.equals("readCheck")) {
			String sender = element.getAsJsonObject().get("sender").getAsString();
			String receiver = element.getAsJsonObject().get("receiver").getAsString();
			//������ ���� ȸ�� ���� ���� ���� �� ����
			int messageCount = service.selectMessageCount(receiver);
			JsonObject obj1 = new JsonObject();
			obj1.addProperty("type", "myMessageCount");
			obj1.addProperty("messageCount", messageCount);
			String resultStr = new Gson().toJson(obj1);
			TextMessage tm = new TextMessage(resultStr);
			session.sendMessage(tm); 
			//��� ���� ������ ���� ����� ������ ������
			WebSocketSession senderSession = connectionMemberList.get(sender);
			if(senderSession != null) {
				JsonObject obj2 = new JsonObject();
				obj2.addProperty("type", "readDm");
				String resultMsg = new Gson().toJson(obj2);
				TextMessage tm2 = new TextMessage(receiveMsg);
				senderSession.sendMessage(tm2);
			}
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//���� ������ ȸ���� ȸ����Ͽ��� ����
		connectionMemberList.values().remove(session);
	}
	
}
