package kr.or.iei.board.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

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
		model.addAttribute("bf",bfvd.getBf());
		model.addAttribute("fcList", bfvd.getCommentList());
		model.addAttribute("fcreList",bfvd.getReCommentList());
		System.out.println(model);
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
					System.out.println("삭제완료");
				}else {
					System.out.println("삭제실패");
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
					System.out.println("파일 삭제 성공");
				}else {
					System.out.println("파일 삭제 실패");
				}
			}
			return "redirect:/boardFoodList.do?reqPage=1";
		}
	}
	@RequestMapping(value = "/insertFoodComment.do")
	public String foodCommentInsert(FoodComment fc) {
		int result = service.insertFoodComment(fc);
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
//	  @RequestMapping(value="/SummerNoteImageFile.do" , method = RequestMethod.POST)
//		public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
//			JsonObject jsonObject = service.SummerNoteImageFile(file);
//			 System.out.println("json!! : "+jsonObject);
//			 System.out.println("여기까지 도달함");
//			return jsonObject;
//		}
}
