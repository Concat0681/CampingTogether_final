package kr.or.iei.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.notice.model.dao.NoticeDao;
import kr.or.iei.notice.model.vo.Notice;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;

	public ArrayList<Notice> selectNoticeList() {
		return dao.selectNoticeList();
	}

	public int insertNoitce(Notice n) {
		return dao.insertNotice(n);
	}

	public Notice selectOneNotice(int noticeNo) {
		return dao.selectOneNotice(noticeNo);
	}

	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.updateNotice(n);
	}

	public int deleteNotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}
}
