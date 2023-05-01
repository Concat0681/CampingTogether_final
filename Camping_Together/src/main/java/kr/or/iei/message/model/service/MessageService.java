package kr.or.iei.message.model.service;

import kr.or.iei.message.model.dao.MessageDao;
import kr.or.iei.message.model.vo.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
	
	@Transactional
	public Message selectOneMessage(int messageNo) {
		Message mg = dao.selectOneMessage(messageNo);
		if(mg.getReadCheck() == 0 ) {
			dao.updateReadCheck(messageNo);
		}
		return mg;
	}
	public int selectMessageCount(String memberId) {
		int messageCount = dao.selectMessageCount(memberId);
		return messageCount;
	}
	@Transactional
	public int updateMessageReadStatus(Message message) {
		 return dao.updateMessageReadStatus(message);
	}

	public List<Message> getSendMessageList(String sender) {
    return dao.selectSendMessageList(sender);
	}
	
	

}
