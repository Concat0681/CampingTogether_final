package kr.or.iei.usedBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.usedBoard.model.service.UsedBoardService;
import kr.or.iei.usedBoard.model.vo.UsedBoard;

@Controller
public class UsedBoardController {

	@Autowired
	private UsedBoardService service;
	
	@RequestMapping(value="/usedBoardList.do")
	public String usedBoardList(Model model) {
		ArrayList<UsedBoard> list = service.usedBoardList();
		return "usedBoard/usedBoardList";
	}
	@RequestMapping(value="/usedBoardWriteFrm.do")
	public String usedBoardWriteFrm() {
		return "usedBoard/usedBoardWriteFrm";
	}
}
