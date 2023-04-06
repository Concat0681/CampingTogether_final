package kr.or.iei.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.message.model.vo.Message;

@Repository
public class MessageDao {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public int insertMessage(Message message) {
        return sqlSession.insert("message.insertMessage", message);
    }

    public ArrayList<Message> selectMessagelist(Message message) {
        return (ArrayList) sqlSession.selectList("message.selectMessagelist", message);
    }

    public Message selectOneMessage(Message message) {
        return sqlSession.selectOne("message.selectOneMessage", message);
    }

	public int selectMessageCount(String memberId) {
		int messageCount = sqlSession.selectOne("message.messageCount", memberId);
		return messageCount;
	}

	public int updateMessageReadStatus(Message message) {
		return sqlSession.update("message.updateMessageReadStatus", message);
	}



}
