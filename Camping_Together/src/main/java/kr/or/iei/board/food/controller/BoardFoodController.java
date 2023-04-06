package kr.or.iei.board.food.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.board.food.model.service.BoardFoodService;
import kr.or.iei.board.food.model.vo.BoardFoodPageData;

@Controller
public class BoardFoodController {

	@Autowired
	private BoardFoodService service;
	
	@RequestMapping(value="/boardFoodList.do")
	private String BoardFoodList(int reqPage, Model model) {
		BoardFoodPageData bfpd = service.selectFoodList(reqPage);
		model.addAttribute("list", bfpd.getList());
		model.addAttribute("pageNavi",bfpd.getPageNavi());
		System.out.println(model);
		return "boardFood/boardFoodList";
	}
}
