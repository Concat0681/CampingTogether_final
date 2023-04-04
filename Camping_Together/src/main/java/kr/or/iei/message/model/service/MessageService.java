package kr.or.iei.message.model.service;

import kr.or.iei.message.model.dao.MessageDao;
import kr.or.iei.message.model.vo.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class MessageService {

	@Autowired
	private MessageDao dao;
	
	@Transactional
	public int insertMessage(Message message) {
		return dao.insertMessage(message);
	}

	public ArrayList<Message> selectMessagelist(Message message) {
		return dao.selectMessagelist(message);
	}

	public Message selectOneMessage(Message message) {
		return dao.selectOneMessage(message);
	}

	public int selectMessageCount(String memberId) {
		int messageCount = dao.selectMessageCount(memberId);
		return messageCount;
	}
	
	

}
