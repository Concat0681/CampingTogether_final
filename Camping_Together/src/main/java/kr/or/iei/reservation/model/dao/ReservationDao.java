package kr.or.iei.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
