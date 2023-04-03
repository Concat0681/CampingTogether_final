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
	//접속한 회원의 세션을 저장하는 리스트
	private ArrayList<WebSocketSession> sessionList;
	//세션에대한 아이디 mapping
	private HashMap<WebSocketSession, String> memberList;
	
	public AllMemberChat() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<WebSocketSession, String>();
	}
	
	//클라이언트가 웹소켓으로 최초에 접속했을 때 자동으로 수행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("클라이언트가 접속함");
		//최초 접속한 session정보를 세션목록에 추가
		sessionList.add(session);

	}
	
	//클라이언트가 메세지를 보내면 처리할 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//문자열을 JSON으로 변환할 객체
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parseString(message.getPayload());
		//key가 type인 값을 추출 후 문자열
		String type = element.getAsJsonObject().get("type").getAsString();
		//key가 msg인 값을 추출 후 문자열
		String msg = element.getAsJsonObject().get("msg").getAsString();
		if(type.equals("enter")) {
			//최초 접속이므로 memberList에 정보 저장
			memberList.put(session, msg);
			String sendMsg = "<p>"+msg+"님이 입장하셨습니다.</p>";
			//클라이언트 전송용 객체
			TextMessage tm = new TextMessage(sendMsg);
			for(WebSocketSession s : sessionList) {
				//방금 접속한 세션이랑 다른 경우에만 전송시킴
				if(!s.equals(session)) {
					s.sendMessage(tm);
				}
			}
		}else if(type.equals("chat")) {
			//왼쪽 메세지(보낸 사람  아이디, 메세지)
			String sendMsg = "<span class='chatId'>"+memberList.get(session)+"</span><div class='chat left'>"+msg+"</div>";
			TextMessage tm = new TextMessage(sendMsg);
			for(WebSocketSession s : sessionList) {
				//방금 접속한 세션이랑 다른 경우에만 전송시킴
				if(!s.equals(session)) {
					s.sendMessage(tm);
				} 
			}
		}

	}
	//클라이언트와 연결이 끊어졌을 때 자동으로 수행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("클라이언트랑 연결 끊김");
		//연걸이 끊기면 세션 목록에서 제거
		sessionList.remove(session);
		String sendMsg = "<p>"+memberList.get(session)+"님이 나가셨습니다.</p>";
		TextMessage tm = new TextMessage(sendMsg);
		for(WebSocketSession s : sessionList) {
			s.sendMessage(tm);
		}
		memberList.remove(session);
	}
}
