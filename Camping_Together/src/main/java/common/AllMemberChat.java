package common;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class AllMemberChat extends TextWebSocketHandler {
	//������ ȸ���� ������ �����ϴ� ����Ʈ
	private ArrayList<WebSocketSession> sessionList;
	//���ǿ����� ���̵� mapping
	private HashMap<WebSocketSession, String> memberList;
	
	public AllMemberChat() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<WebSocketSession, String>();
	}
	
	//Ŭ���̾�Ʈ�� ���������� ���ʿ� �������� �� �ڵ����� ����Ǵ� �޼���
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("Ŭ���̾�Ʈ�� ������");
		//���� ������ session������ ���Ǹ�Ͽ� �߰�
		sessionList.add(session);

	}
	
	//Ŭ���̾�Ʈ�� �޼����� ������ ó���� �޼���
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//���ڿ��� JSON���� ��ȯ�� ��ü
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parseString(message.getPayload());
		//key�� type�� ���� ���� �� ���ڿ�
		String type = element.getAsJsonObject().get("type").getAsString();
		//key�� msg�� ���� ���� �� ���ڿ�
		String msg = element.getAsJsonObject().get("msg").getAsString();
		if(type.equals("enter")) {
			//���� �����̹Ƿ� memberList�� ���� ����
			memberList.put(session, msg);
			String sendMsg = "<p>"+msg+"���� �����ϼ̽��ϴ�.</p>";
			//Ŭ���̾�Ʈ ���ۿ� ��ü
			TextMessage tm = new TextMessage(sendMsg);
			for(WebSocketSession s : sessionList) {
				//��� ������ �����̶� �ٸ� ��쿡�� ���۽�Ŵ
				if(!s.equals(session)) {
					s.sendMessage(tm);
				}
			}
		}else if(type.equals("chat")) {
			//���� �޼���(���� ���  ���̵�, �޼���)
			String sendMsg = "<span class='chatId'>"+memberList.get(session)+"</span><div class='chat left'>"+msg+"</div>";
			TextMessage tm = new TextMessage(sendMsg);
			for(WebSocketSession s : sessionList) {
				//��� ������ �����̶� �ٸ� ��쿡�� ���۽�Ŵ
				if(!s.equals(session)) {
					s.sendMessage(tm);
				} 
			}
		}

	}
	//Ŭ���̾�Ʈ�� ������ �������� �� �ڵ����� ����Ǵ� �޼���
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("Ŭ���̾�Ʈ�� ���� ����");
		//������ ����� ���� ��Ͽ��� ����
		sessionList.remove(session);
		String sendMsg = "<p>"+memberList.get(session)+"���� �����̽��ϴ�.</p>";
		TextMessage tm = new TextMessage(sendMsg);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(tm);
		}
		memberList.remove(session);
	}
}
