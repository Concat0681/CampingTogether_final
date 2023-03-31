package kr.or.iei.camping.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.iei.camping.model.dao.CampingDao;
import kr.or.iei.camping.model.vo.Camping;
import kr.or.iei.camping.model.vo.CampingListPageData;
import kr.or.iei.camping.model.vo.CampingProvide;
import kr.or.iei.camping.model.vo.CampingRoom;

@Service
public class CampingService {

	@Autowired
	private CampingDao dao;

	public int insertCamping(Camping c) {
		int result = dao.insertCamping(c);
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
	}

	public CampingListPageData selectCampingListData(int reqPage, String order, CampingProvide campingProvide, CampingRoom campingRoom) {
		//�븳 �럹�씠吏��떦 蹂댁뿬以� 寃뚯떆湲� �닔 : 2
		int numPerPage = 5;
		//reqPage = 1 : 1~2, reqPage = 2 : 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		//怨꾩궛�맂 start, end瑜� 媛�吏�怨� 寃뚯떆臾� 紐⑸줉 議고쉶
		//mybatis�뒗 留ㅺ컻蹂��닔瑜� 1媛쒕쭔 �꽕�젙�씠 媛��뒫 -> �븘�슂�븳 媛믪씠 �뿬�윭媛쒕㈃ 1媛� 臾띠뼱�빞�븿(VO, map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("order", order);
		map.put("campingEtc", campingProvide.getCampingEtc());
		map.put("campingRoomService", campingProvide.getCampingRoomService());
		map.put("campingService", campingProvide.getCampingService());
		map.put("campingRoomType", campingRoom.getCampingRoomType());
		map.put("pplCount", campingRoom.getCampingRoomMaxPplCount());
		
		ArrayList<Camping> list = dao.selectCampingListData(map);
		//pageNavi �젣�옉 �떆�옉
		//�쟾泥댄럹�씠吏� �닔 怨꾩궛�븘�슂 -> �쟾泥� 寃뚯떆臾� �닔 議고쉶
		int totalCount = dao.selectCampingCount();
		//�쟾泥� 寃뚯떆臾쇰줈 �쟾泥� �럹�씠吏��닔 怨꾩궛
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		//�럹�씠吏� �꽕鍮� �궗�씠利�
		int pageNaviSize = 5;
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2 ;
		}
		//�럹�씠吏��꽕鍮� �깮�꽦�떆�옉
		String pageNavi = "";
		//�씠�쟾 踰꾪듉
		if(pageNo != 1) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[�씠�쟾]</a>";
		}
		//�럹吏� �닽�옄 �깮�꽦
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
		//�떎�쓬 踰꾪듉
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/boardList.do?reqPage="+(pageNo)+"'>[�떎�쓬]</a>";
		}
		CampingListPageData cpd = new CampingListPageData();
		cpd.setList(list);
		cpd.setPageNavi(pageNavi);
		return cpd;
	}
}
