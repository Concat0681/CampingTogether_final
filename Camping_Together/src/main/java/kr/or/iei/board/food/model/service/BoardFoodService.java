package kr.or.iei.board.food.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.iei.board.food.model.dao.BoardFoodDao;
import kr.or.iei.board.food.model.vo.BoardFood;
import kr.or.iei.board.food.model.vo.BoardFoodPageData;
import kr.or.iei.board.food.model.vo.BoardFoodViewData;
import kr.or.iei.board.food.model.vo.FileVO;
import kr.or.iei.board.food.model.vo.FoodComment;

@Service
public class BoardFoodService {

	@Autowired
	private BoardFoodDao dao;

	public BoardFoodPageData selectFoodList(int reqPage) {
//		
////		ArrayList<Frip> list = dao.selectAllFrip(conn);
//		
//	      for(boardFood bf : list) {
//	         ArrayList<String> fripFiles = dao.selectFripFiles(bf.getFripNo());
//	         bf.setFilePath(fripFiles);
//	        
//	      }
//	      return list;
//		
		
		
		int numPerPage = 12;
		int end = numPerPage * reqPage;
		int start = end - numPerPage +1 ;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end); 
		ArrayList<BoardFood> list = dao.selectFoodList(map);
		
		int totalCount = dao.selectFoodCount();
		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 네비게이션 사이즈
				int pageNaviSize = 5; // 기본값 5

				// 페이지 네비게이션 시작번호
				// reqPage 1 ~ 5 : 1 2 3 4 5
				// reqPAge 6 ~ 10 : 6 7 8 9 10

				// 시작값 구하기 1, 6, 11 ....
				int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

				// 페이지 네이게이션 제작 시작
				String pageNavi = "<ul class='pagination circle-style'>";
				// 이전버튼
				if (pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/boardFoodList.do?reqPage=" + (pageNo - 1) + "'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				// 페이지 숫자
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/boardFoodList.do?reqPage=" + (pageNo) + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
							pageNavi += "<li>";
							pageNavi += "<a class='page-item' href='/boardFoodList.do?reqPage=" + (pageNo) + "'>";
							pageNavi += pageNo;
							pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				// 다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/boardFoodList.do?reqPage=" + (pageNo) + "'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
		BoardFoodPageData bfpd = new BoardFoodPageData(list, pageNavi);
		return bfpd;
	}

	public int insertBoardFood(BoardFood b, ArrayList<FileVO> fileList) {
		int result = dao.insertBoardFood(b);
		System.out.println(b);
		if(result>0) {
			for(FileVO file : fileList) {
				file.setBoardFoodNo(b.getBoardFoodNo());
				result += dao.insertFile(file);
			}
		}
		return result;
	}

	public BoardFoodViewData selectOneBoardFood(int boardFoodNo) {
		int result = dao.updateReadCount(boardFoodNo);
		if(result>0) {
			BoardFood bf = dao.selectOneBoardFood(boardFoodNo);
			
			//댓글 
			ArrayList<FoodComment> commentList = dao.selectFoodComment(boardFoodNo);
			//대댓글
			ArrayList<FoodComment> reCommentList = dao.selectReCommentList(boardFoodNo);
		
			
			BoardFoodViewData bfvd = new BoardFoodViewData(bf,commentList,reCommentList);

			return bfvd;
		}else {
			return null;
			
		}
	}

	public BoardFood getBoardFood(int boardFoodNo) {
		
		return dao.selectOneBoardFood(boardFoodNo);
	}

	public int boardFoodUpdate(BoardFood bf, ArrayList<FileVO> fileList, int[] fileNo) {
		int resulut = dao.updateBoardFood(bf);
		if(resulut>0) {
			if(fileNo != null) {
				for(int no : fileNo) {
					resulut += dao.deleteFile(no);
				}
			}
			for(FileVO f : fileList) {
				f.setBoardFoodNo(bf.getBoardFoodNo());
				resulut += dao.insertFile(f);
			}
		}
		return resulut;
	}

	public ArrayList<FileVO> deleteBoardFood(int boardFoodNo) {
		ArrayList<FileVO> fileList = dao.selectFileList(boardFoodNo);
		int result = dao.deleteBoardFood(boardFoodNo);
		if(result>0) {
			return fileList;
		}else {
			return null;
		}
	}

	public int insertFoodComment(FoodComment fc) {
		int result = dao.insertFoodComment(fc);
		return result;
	}

	public int updateFoodComment(FoodComment fc) {
		int result = dao.updateFoodComment(fc);
		return result;
	}

	public int deleteFoodComment(int foodCommentNo) {
		int result = dao.deleteFoodComment(foodCommentNo);
		return result;
	}

//	public JsonObject SummerNoteImageFile(MultipartFile file) {
//		JsonObject jsonObject = new JsonObject();
//		String fileRoot = "C:\\summernoteImg\\";
//		String originalFileName = file.getOriginalFilename();
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//		
//		String saveFileName = UUID.randomUUID()+extension;
//			
//		File targetFile = new File(fileRoot+saveFileName);
//		
//		try {
//			InputStream fileStream = file.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
//			jsonObject.addProperty("responseCode", "succcess");
//		} catch(IOException e) {
//			FileUtils.deleteQuietly(targetFile);
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}	
//		return jsonObject;
//
//
//	}
	
	
	

}
