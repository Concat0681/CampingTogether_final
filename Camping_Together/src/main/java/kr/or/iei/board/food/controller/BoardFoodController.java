package kr.or.iei.board.food.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	//메인용 메소드 - food 리스트 최신순 5개
	@RequestMapping(value="/boardMainFoodList.do")
	public String boardFoodList(Model model, BoardFood b ) {
		ArrayList<BoardFood> list = service.selectMainFoodList(b);
		model.addAttribute("foodlist", list);
		return "main/mainIndexBoardList";
	}
	/*
	//메인용 메소드 - food 댓글 카운트
	@RequestMapping(value="/foodCommnetCount.do")
	public String foodCommnetCount(Model model, FoodComment fc ) {
		FoodComment count = service.foodCommnetCount(fc);
		model.addAttribute("count", count);
		return "main/mainIndexBoardList";
	}
	*/
	
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
		model.addAttribute("fcreList",bfvd.getReCommentList());
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
	@RequestMapping(value="/boardFoodFileDown.do")
	public void boardFileDown(int fileNo, HttpServletRequest request, HttpServletResponse response) {
		//fileNo : DB���� filename, filepath�� ��ȸ�ؿ������� �뵵
		//request : ������ġ ã�� �� ���
		//response : ���ϴٿ�ε� ���� ���� �� ���
		//������ �������� - �������̵��� �ʿ�����Ƿ�
		
		//filename�� filepath�� ã�ƿ������ؼ�
		FileVO file = service.getFile(fileNo);
		System.out.println(file);
		//���ϰ��
		String root = request.getSession().getServletContext().getRealPath("/resources/upload/boardFood/");
		String downFile = root+file.getFilepath();
		
		//������ �о�������� �ֽ�Ʈ������(�ӵ����������� ������Ʈ������)
		try {
			FileInputStream fis = new FileInputStream(downFile);
			BufferedInputStream bis = new BufferedInputStream(fis);
			//�о�� ������ ����ڿ��� ������ ��Ʈ������
			ServletOutputStream sos = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			//���ϸ� ó��
			String resFilename = new String(file.getFilepath().getBytes("UTF-8"), "ISO-8859-1");
			response.setContentType("application/octet-stream");//���������̶����� �˷���
			response.setHeader("Content-Disposition", "attachment;filename="+resFilename);//�����̸��� �˷���
			//��������
			while(true) {
				int read = bis.read();
				//������ ��� �дٰ� �������� ����
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bos.close();
			bis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	   public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
	      JsonObject jsonObject = new JsonObject();
	      
	        /*
	       * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
	       */
	      
	      // 내부경로로 저장
	      String contextRoot = request.getSession().getServletContext().getRealPath("/resources/upload/summernote/");
	      
	      String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
	      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
	      String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명
	      
	      File targetFile = new File(contextRoot + savedFileName);   
	      try {
	         InputStream fileStream = multipartFile.getInputStream();
	         FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
	         jsonObject.addProperty("url", "/resources/upload/summernote/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
	         jsonObject.addProperty("responseCode", "success");
	            
	      } catch (IOException e) {
	         FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
	         jsonObject.addProperty("responseCode", "error");
	         e.printStackTrace();
	      }
	      String a = jsonObject.toString();
	      return a;
	   }

}
