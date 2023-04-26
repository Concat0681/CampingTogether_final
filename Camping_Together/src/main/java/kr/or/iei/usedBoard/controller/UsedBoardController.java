package kr.or.iei.usedBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.iei.usedBoard.model.service.UsedBoardService;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardComment;
import kr.or.iei.usedBoard.model.vo.UsedBoardPageData;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;
import kr.or.iei.usedBoard.model.vo.UsedWishList;

@Controller
public class UsedBoardController {

	@Autowired
	private UsedBoardService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/usedBoardIndex.do")
	public String getTop3UsedBoards(Model model, UsedBoard ub) {
		ArrayList<UsedBoard> top3UsedBoards = service.getTop3UsedBoards(ub);
        model.addAttribute("top3UsedBoards", top3UsedBoards);
        return "main/mainIndexList";
    }
	
	@RequestMapping(value="/usedBoardList.do")
	public String usedBoardList(int reqPage, String memberId, Model model) {
		String usedBoardWriter = "";
		UsedBoardPageData ubpd = service.selectUsedBoardList(reqPage, memberId, usedBoardWriter);
		model.addAttribute("list", ubpd.getList());
		model.addAttribute("pageNavi", ubpd.getPageNavi());
		return "usedBoard/usedBoardList";
	}
	
	@RequestMapping(value="/usedBoardWriteFrm.do")
	public String usedBoardWriteFrm() {
		return "usedBoard/usedBoardWriteFrm";
	}
	
	@RequestMapping(value="/usedBoardWrite.do")
	public String boardWrite(UsedBoard ub, MultipartFile[] usedBoardPhoto, HttpServletRequest request) {
		ArrayList<UsedBoardPhoto> photoList = new ArrayList<UsedBoardPhoto>();
		if(!usedBoardPhoto[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/usedBoard/");
			for(MultipartFile file : usedBoardPhoto) {
				String filepath = manager.upload(savePath, file);
				UsedBoardPhoto ubp = new UsedBoardPhoto();
				ubp.setFilepath(filepath);
				photoList.add(ubp);
			}
		}
		int result = service.insertUsedBoard(ub, photoList);
		if(result == photoList.size()+1) {
			return "redirect:/usedBoardList.do?reqPage=1";
		}else {
			return "redirect:/";			
		}
	}
	
	@RequestMapping(value="/usedBoardView.do")
	public String usedBoardView(int usedBoardNo, Model model) {
		UsedBoard ub = service.selectOneUsedBoard(usedBoardNo);
		ArrayList<UsedBoardComment> list = service.selectCommentList(usedBoardNo);
		int commentCount = service.commentCount(usedBoardNo);
		model.addAttribute("ub", ub);
		model.addAttribute("list", list);
		model.addAttribute("commentCount", commentCount);
		return "usedBoard/usedBoardView";
	}
	@RequestMapping(value="/usedBoardCommentWrite.do")
	public String usedBoardCommentWrite(UsedBoardComment ubc) {
		int result = service.usedBoardCommentInsert(ubc);
		return "redirect:/usedBoardView.do?usedBoardNo="+ubc.getUsedBoardNo();
	}
	@RequestMapping(value="/usedBoardCommentUpdate.do")
	public String usedBoardCommentUpdate(UsedBoardComment ubc) {
		int result = service.updateUsedBoardComment(ubc);
		System.out.println(result);
		return "redirect:/usedBoardView.do?usedBoardNo="+ubc.getUsedBoardNo();
	}
	@RequestMapping(value="/usedBoardCommentDelete.do")
	public String usedBoardCommentDelete(int usedBoardCommentNo, int usedBoardNo) {
		int result = service.deleteUsedBoardComment(usedBoardCommentNo);
		return "redirect:/usedBoardView.do?usedBoardNo="+usedBoardNo;
	}
	@ResponseBody
	@RequestMapping(value="/sellUserCheck.do", produces = "application/json;charset=utf-8")
	public String sellUserCheck(String usedBoardWriter) {
		//유저정보 등록
		UsedBoard ub = service.sellUserCheck(usedBoardWriter);
		//블랙횟수
		int blackCount = service.sellerBlackCount(usedBoardWriter); 
		ub.setSellerblackCount(blackCount);
		Gson gson = new Gson();
		String result = gson.toJson(ub);
		return result;
	}
	@RequestMapping(value="/usedBoardDelete.do")
	public String usedBoardDelete(int usedBoardNo, HttpServletRequest request) {
		//1. 파일불러오기(+게시글삭제)
		ArrayList<UsedBoardPhoto> list = service.deleteUsedBoard(usedBoardNo);
		//2. 삭제하기
		if( list == null ) {
			return "redirect:/usedBoardView.do?usedBoardNo="+usedBoardNo;
		}else {
			//파일 삭제
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/usedBoard/");
			for(UsedBoardPhoto photo : list) {
				manager.deleteFile(savePath, photo.getFilepath());
			}
			return "redirect:/usedBoardList.do?reqPage=1";
		}
	}
	@RequestMapping(value="/usedBoardUpdateFrm.do")
	public String usedBoardUpdateFrm(int usedBoardNo, Model model) {
		UsedBoard ub = service.selectUpdateUsedBoard(usedBoardNo);
		model.addAttribute("ub", ub);
		return "usedBoard/usedBoardUpdateFrm";
	}
	@RequestMapping(value="/boardUpdate.do")
	public String usedBoardUpdate(UsedBoard ub, int[] fileNo, String[] filepath,  MultipartFile[] usedBoardPhoto, HttpServletRequest request) {
		ArrayList<UsedBoardPhoto> filelist = new ArrayList<UsedBoardPhoto>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/usedBoard/");
		if(!usedBoardPhoto[0].isEmpty()) {
			for(MultipartFile file : usedBoardPhoto ) {
				String upFilepath = manager.upload(savePath, file);
				UsedBoardPhoto usedPhoto = new UsedBoardPhoto();
				usedPhoto.setFilepath(upFilepath);
				filelist.add(usedPhoto);
			}
		}
		int result = service.updateUsedBoard(ub, filelist, fileNo);
		//업데이트 성공 : result == 삭제파일 + 추가파일 + 1
		if(fileNo != null && (result == (filelist.size() + fileNo.length + 1))) {
			for(String delFile : filepath) {
				//폴더에 들어있는 이미지 삭제
				manager.deleteFile(savePath, delFile);
			}
			return "redirect:/usedBoardView.do?usedBoardNo="+ub.getUsedBoardNo();
		}else if(fileNo == null && (result == filelist.size() + 1)) {
			return "redirect:/usedBoardView.do?usedBoardNo="+ub.getUsedBoardNo();
		}else {
			return "redirect:/usedBoardList.do?reqPage=1";
		}
	}
	@RequestMapping(value="/usedBoardStatusUpdate.do")
	public String usedBoardStatusUpdate(int usedBoardNo) {
		int result = service.updateUsedBoardStatus(usedBoardNo);
		return "redirect:/usedBoardView.do?usedBoardNo="+usedBoardNo;
	}
	
	@ResponseBody
	@RequestMapping(value="/wishInsert.do")
	public String wishInsert(UsedWishList uwl) {
		int result = service.insertUsedWishList(uwl);
		if(result > 0) {
			return "ok";
		}else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/wishDelete.do")
	public String wishDelete(UsedWishList uwl) {
		int result = service.deleteUsedWishList(uwl);
		if(result > 0) {
			return "ok";			
		}else {
			return "no";
		}
	}
}





