package kr.or.iei.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectNoticeList(HashMap<String,Object> map) {
		List list = sqlSession.selectList("notice.selectNoticeList",map);
		return (ArrayList<Notice>)list;
	}

	public int insertNotice(Notice n) {
		int result = sqlSession.insert("notice.insertNoitce",n);
		return result;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = sqlSession.selectOne("notice.selectOneNotice",noticeNo);
		return n;
	}

	public int updateNotice(Notice n) {
		int result = sqlSession.update("notice.updateNotice",n);
		return result;
	}

	public int deleteNotice(int noticeNo) {
		int result = sqlSession.delete("notice.deleteNotice",noticeNo);
		return result;
	}

	public int selectNoticeCount() {
		int totalCount = sqlSession.selectOne("notice.totalCount");
		return totalCount;
	}
}
