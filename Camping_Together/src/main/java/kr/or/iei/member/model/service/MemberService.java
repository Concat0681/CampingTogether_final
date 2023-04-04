package kr.or.iei.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

@Service
public class MemberService {

	
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
			return dao.selectOneMember(member);
		}

	@Transactional
	public int insertMember(Member member) {
		dao.insertMember(member);
		return 0;
	}

	
	//회원탈퇴
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}
	
	

	
	
	
}
