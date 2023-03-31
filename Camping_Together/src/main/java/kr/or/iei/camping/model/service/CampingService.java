package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.camping.model.dao.CampingDao;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;

	public CampingListPageData selectCampingListData(int reqPage, String order) {
		//한 페이지당 보여줄 게시글 수 : 2
				int numPerPage = 5;
				//reqPage = 1 : 1~2, reqPage = 2 : 3~4
				int end = reqPage * numPerPage;
				int start = end - numPerPage + 1;
				//계산된 start, end를 가지고 게시물 목록 조회
				//mybatis는 매개변수를 1개만 설정이 가능 -> 필요한 값이 여러개면 1개 묶어야함(VO, map)
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				map.put("order", order);
				map.put("campingEtc", null);
				map.put("campingRoomService", null);
				map.put("campingService", null);
				map.put("campingType", null);
				
				
				ArrayList<Camping> list = dao.selectCampingListData(map);
				//pageNavi 제작 시작
				//전체페이지 수 계산필요 -> 전체 게시물 수 조회
				int totalCount = dao.selectCampingCount();
				//전체 게시물로 전체 페이지수 계산
				int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
				//페이지 네비 사이즈
				int pageNaviSize = 5;
				int pageNo = 1;
				if(reqPage > 3) {
					pageNo = reqPage - 2 ;
				}
				//페이지네비 생성시작
				String pageNavi = "";
				//이전 버튼
				if(pageNo != 1) {
					pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
				}
				//페지 숫자 생성
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<span>"+pageNo+"</span>";
					} else {
						pageNavi += "<a href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						break;
					}
				}
				//다음 버튼
				if(pageNo <= totalPage) {
					pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>[다음]</a>";
				}
				CampingListPageData cpd = new CampingListPageData();
				cpd.setList(list);
				cpd.setPageNavi(pageNavi);
				return cpd;
	}

	public CampingListPageData selectCampingListData(int reqPage, String order, CampingProvide campingProvide, String[] campingType) {
		//한 페이지당 보여줄 게시글 수 : 2
		int numPerPage = 5;
		//reqPage = 1 : 1~2, reqPage = 2 : 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		//계산된 start, end를 가지고 게시물 목록 조회
		//mybatis는 매개변수를 1개만 설정이 가능 -> 필요한 값이 여러개면 1개 묶어야함(VO, map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		map.put("campingEtc", campingProvide.getCampingEtc());
		map.put("campingRoomService", campingProvide.getCampingRoomService());
		map.put("campingService", campingProvide.getCampingService());
		map.put("campingType", campingType);
		
		ArrayList<Camping> list = dao.selectCampingListData(map);
		//pageNavi 제작 시작
		//전체페이지 수 계산필요 -> 전체 게시물 수 조회
		int totalCount = dao.selectCampingCount();
		//전체 게시물로 전체 페이지수 계산
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		//페이지 네비 사이즈
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2 ;
		}
		//페이지네비 생성시작
		String pageNavi = "";
		//이전 버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//페지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			} else {
				pageNavi += "<a href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>[다음]</a>";
		}
		CampingListPageData cpd = new CampingListPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}

}
