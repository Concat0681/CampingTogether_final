package kr.or.iei.board.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.or.iei.board.food.model.service.BoardFoodService;
import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.board.food.model.vo.BoardFoodPageData;
import kr.or.iei.board.food.model.vo.BoardFoodViewData;
import kr.or.iei.board.food.model.vo.FileVO;

@Controller
public class BoardFoodController {

	@Autowired
	private BoardFoodService service;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/boardFoodList.do")
	public String boardFoodList(int reqPage, Model model) {
		BoardFoodPageData bfpd = service.selectFoodList(reqPage);
		model.addAttribute("list", bfpd.getList());
		model.addAttribute("pageNavi",bfpd.getPageNavi());
		return "boardFood/boardFoodList";
	}
	@RequestMapping(value="/boardFoodWriteFrm.do")
	public String boardFoodWriteFrm() {
		return "boardFood/boardFoodWriteFrm";
	}
	@RequestMapping(value="/boardFoodWrite.do")
	public String boardFoodWrite(BoardFood b, MultipartFile[] imageFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!imageFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/boardFood/");
			for(MultipartFile file : imageFile) {
				String filepath = fileManager.upload(savePath,file);
				
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertBoardFood(b, fileList);
		// insert한 게시글 1개 + insert한 파일 개수
		if(result == (fileList.size()+1)) {
			return "redirect:/boardFoodList.do?reqPage=1";
			
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/boardFoodView.do")
	public String boardView(int boardFoodNo, Model model) {
		BoardFoodViewData bfvd = service.selectOneBoardFood(boardFoodNo);
//		model.addAttribute("bfvd",bfvd.getBf());
//		model.addAttribute("bfvd", bfvd.getCommentList());
//		model.addAttribute("bfvd",bfvd.getRecommentList());
		System.out.println(bfvd);
		System.out.println(model);
		if(bfvd!=null) {
			return "boardFood/boarFoodView";
		}else {
			return "redirect:/boardFoodList.do?reqPage=1";
		}
	}
}
