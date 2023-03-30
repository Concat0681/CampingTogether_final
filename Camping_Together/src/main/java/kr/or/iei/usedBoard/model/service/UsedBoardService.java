package kr.or.iei.usedBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.usedBoard.model.dao.UsedBoardDao;
import kr.or.iei.usedBoard.model.vo.UsedBoard;

@Service
public class UsedBoardService {

	@Autowired
	private UsedBoardDao dao;

	public ArrayList<UsedBoard> usedBoardList() {
		
		return null;
	}
}
