package kr.or.iei.camping.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.camping.model.dao.CampingDao;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;
}
