package kr.or.iei.usedBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.or.iei.usedBoard.model.service.UsedBoardService;
import kr.or.iei.usedBoard.model.vo.UsedBoard;
import kr.or.iei.usedBoard.model.vo.UsedBoardPhoto;

@Controller
public class UsedBoardController {

	@Autowired
	private UsedBoardService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/usedBoardList.do")
	public String usedBoardList(Model model) {
		ArrayList<UsedBoard> list = service.usedBoardList();
		return "usedBoard/usedBoardList";
	}
	@RequestMapping(value="/usedBoardWriteFrm.do")
	public String usedBoardWriteFrm() {
		return "usedBoard/usedBoardWriteFrm";
	}
	@RequestMapping(value="/boardWrite.do")
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
		return null;
	}
}
