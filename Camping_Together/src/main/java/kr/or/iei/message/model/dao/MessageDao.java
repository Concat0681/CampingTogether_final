package kr.or.iei.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.message.model.vo.Message;

@Repository
public class MessageDao {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    
    public String countMessageView(Message message) {
        return sqlSession.selectOne("message.countMessageView", message);
    }
    
    public int insertMessage(Message message) {
        return sqlSession.insert("message.insertMessage", message);
    }
    public ArrayList<Message> selectMessagelist(Message message) {
    	List list = sqlSession.selectList("message.selectMessageList", message);
    	return (ArrayList<Message>) list;
    }
    
    public Message selectOneMessage(int messageNo) {
    	Message mg = sqlSession.selectOne("message.selectOneMessage", messageNo);
        return  mg;
    }
	public int selectMessageCount(String memberId) {
		int messageCount = sqlSession.selectOne("message.messageCount", memberId);
		return messageCount;
	}
	public int updateMessageReadStatus(Message message) {
		return sqlSession.update("message.updateMessageReadStatus", message);
	}
	public List<Message> selectSendMessageList(String sender) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("sender", sender);
	    return sqlSession.selectList("messageMapper.selectSendMessageList", map);
	}

	public void updateReadCheck(int messageNo) {
		sqlSession.update("message.updateReadCheck", messageNo);
		
	}
}
