package kr.or.iei.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.member.model.vo.Member;

@Repository
public class MemberDao {

	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Member selectOneMember(Member member) {
		System.out.println(member);
		Member m = sqlsession.selectOne("member.selectOneMember", member);
		return m;
	}

	public int insertMember(Member member) {
		int result = sqlsession.insert("member.insertMember", member);
		return result;
	}

	public int deleteMember(int memberNo) {
		int result = sqlsession.delete("member.deleteMember",memberNo);
		return result;
	}
	
	
	
	
	
	
	
	
	
	//-----------------------------------����������
}
