package kr.or.iei.blacklist.controller;

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
import kr.or.iei.blacklist.model.service.BlacklistService;
import kr.or.iei.blacklist.model.vo.Blacklist;
import kr.or.iei.blacklist.model.vo.BlacklistPhoto;
import kr.or.iei.usedBoard.model.vo.UsedBoard;

@Controller
public class BlacklistController {
	@Autowired
	private BlacklistService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/blacklistWriteFrm.do")
	public String blacklistWriteFrm(int usedBoardNo, Model model) {
		UsedBoard ub = service.selectBlackUsedBoard(usedBoardNo);
		model.addAttribute("ub", ub);

		return "blacklist/blacklistWriteFrm";
	}
	
	@RequestMapping(value="/blacklistWrite.do")
	public String blacklistWrite(Blacklist bl, MultipartFile[] blacklistPhoto, HttpServletRequest request) {
		ArrayList<BlacklistPhoto> photoList = new ArrayList<BlacklistPhoto>();
		if(!blacklistPhoto[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/usedBoard/");
			for(MultipartFile file : blacklistPhoto) {
				String filename = file.getOriginalFilename();
				String filepath = manager.upload(savePath, file);
				
				BlacklistPhoto blp = new BlacklistPhoto();
				blp.setFilepath(filepath);
				blp.setFilename(filename);
				photoList.add(blp);
			}
		}
		int result = service.insertBlacklist(bl, photoList);
		if(result == photoList.size()+1) {
			return "redirect:/";
		}else {
			return "redirect:/blacklistWriteFrm.do";
		}
	}	
	@ResponseBody
	@RequestMapping(value="/blacklistMyHistory.do", produces = "application/json;charset=utf-8")
	public String blacklistMyHistory(String memberId){
		ArrayList<Blacklist> blList = service.selectBlacklistMyHistory(memberId);
		Gson gson = new Gson();
		String result = gson.toJson(blList);
		return result;
	}
	
}
