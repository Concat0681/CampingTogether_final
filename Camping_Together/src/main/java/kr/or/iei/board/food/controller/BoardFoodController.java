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
import kr.or.iei.board.food.model.vo.FoodComment;

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
		// insert�� �Խñ� 1�� + insert�� ���� ����
		if(result == (fileList.size()+1)) {
			return "redirect:/boardFoodList.do?reqPage=1";
			
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/boardFoodView.do")
	public String boardView(int boardFoodNo, Model model) {
		BoardFoodViewData bfvd = service.selectOneBoardFood(boardFoodNo);
		model.addAttribute("bf",bfvd.getBf());
		model.addAttribute("fcList", bfvd.getCommentList());
		model.addAttribute("fcreList",bfvd.getRecommentList());
		if(bfvd!=null) {
			return "boardFood/boarFoodView";
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/boardFoodUpdateFrm.do")
	public String boardFoodUpdateFrm(int boardFoodNo, Model model) {
		BoardFood bf = service.getBoardFood(boardFoodNo);
		model.addAttribute("bf",bf);
		return "boardFood/boardFoodUpdateFrm";
	}
	@RequestMapping(value="/boardFoodUpdate.do")
	public String boardFoodUpdate(BoardFood bf, int[] fileNo, String[] filepath,MultipartFile[] imageFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/boardFood/");
		if(!imageFile[0].isEmpty()) {
			for(MultipartFile file : imageFile) {
				String upfilepath = fileManager.upload(savePath,file);
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(upfilepath);
				fileList.add(fileVO);
			}
		}
		int result = service.boardFoodUpdate(bf, fileList ,fileNo);
		if(fileNo != null && (result == (fileList.size()+fileNo.length+1))) {
			for(String delFile : filepath) {
				boolean delResult = fileManager.deleteFile(savePath, delFile);
				System.out.println(result);
				if(delResult) {
					System.out.println("�����Ϸ�");
				}else {
					System.out.println("��������");
				}
			}
			return "redirect:/boardFoodView.do?boardFoodNo="+bf.getBoardFoodNo();
		}else if(fileNo == null && (result == fileList.size()+1)) {
			return "redirect:/boardFoodView.do?boardFoodNo="+bf.getBoardFoodNo();
		}else {
			return "redirect:/boardFoodList.do?reqPage=1";
		}
	}
	@RequestMapping(value ="/boardFoodDelete.do")
	public String boardFoodDelete(int boardFoodNo,HttpServletRequest request) {
		ArrayList<FileVO> list = service.deleteBoardFood(boardFoodNo);
		if(list == null) {
			return "redirect:/boardFoodView.do?boardFoodNo="+boardFoodNo;
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/boardFood/");
			for(FileVO file :list) {
				boolean deleteResult = fileManager.deleteFile(savePath, file.getFilepath());
				if(deleteResult) {
					System.out.println("���� ���� ����");
				}else {
					System.out.println("���� ���� ����");
				}
			}
			return "redirect:/boardFoodList.do?reqPage=1";
		}
	}
	@RequestMapping(value = "/insertFoodComment.do")
	public String foodCommentInsert(FoodComment fc) {
		return "redirect:/boardFoodView.do?boardFoodNo="+fc.getBoardFoodRef();
	}
	@RequestMapping(value = "/updateFoodComment.do")
	public String foodCommentUpdate(FoodComment fc,int boardFoodNo) {
		int resulut = service.updateFoodComment(fc);
		return "redirect:/boardFoodView.do?boardFoodNo="+boardFoodNo;
	}
	@RequestMapping(value="/deleteFoodComment.do")
	public String foodCommentDelete(int foodCommentNo, int boardFoodNo) {
		int result = service.deleteFoodComment(foodCommentNo);
		return "redirect:/boardFoodView.do?boardFoodNo="+boardFoodNo;
	}
}