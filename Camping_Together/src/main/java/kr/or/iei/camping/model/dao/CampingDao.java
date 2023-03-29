package kr.or.iei.camping.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
