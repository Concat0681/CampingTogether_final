package kr.or.iei.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.CampingPayment;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.member.model.vo.MemberPageData;

@Service
public class MemberService {

	
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
			return dao.selectOneMember(member);
		}

	@Transactional
	public int insertMember(Member member) {
		dao.insertMember(member);
		return 0;
	}
	
	public int idCheck(String memberId) {
		return dao.idCheck(memberId);
	}

	
	//占쎌돳占쎌뜚占쎄퉱占쎈닚
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}
	
	public MemberPageData selectPayList(int memberNo,int reqPage) {
		int numPerpage = 5;
		
		//reqPage = 1 -> 1~2,  reqPage = 2 -> 2~3
		int end = reqPage * numPerpage;
		int start = end - numPerpage + 1;
		
		//�④쑴沅쏉옙留� start, end�몴占� 揶쏉옙筌욑옙�⑨옙 野껊슣�뻻�눧占� 筌뤴뫖以� 鈺곌퀬�돳
		//Mybatis占쎈뮉 筌띲끆而삭퉪占쏙옙�땾占쎈뮉 占쎈립揶쏆뮆彛� 占쎄퐬占쎌젟占쎌뵠 揶쏉옙占쎈뮟 -> 占쎈툡占쎌뒄占쎈립 揶쏅�れ뵠 占쎈연占쎌쑎揶쏆뮆�늺 1揶쏆뮆以� �눧�씈堉깍옙鍮욑옙釉� (vo占쎌굢占쎈뮉 map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo", memberNo);
		
		ArrayList<CampingPayment> list = dao.selectPayList(map);
		
		//pageNavi 占쎌젫占쎌삂 占쎈뻻占쎌삂
		//占쎌읈筌ｏ옙 野껊슣�뻻�눧占� 占쎈땾 占쎈툡占쎌뒄 -> 占쎌읈筌ｏ옙 野껊슣�뻻�눧占� 占쎈땾 鈺곌퀬�돳 
		System.out.println(memberNo);
		int totalCount = dao.selectPayListCount(memberNo);
		
		//占쎌읈筌ｋ떯苡띰옙�뻻�눧�눖以� 占쎌읈筌ｏ옙 占쎈읂占쎌뵠筌욑옙 占쎈땾 �④쑴沅�
		int totalPage = (int)Math.ceil(totalCount/(double)numPerpage);
		
		
		//pageNavi占쎄텢占쎌뵠筌앾옙
		int pageNaviSize = 5;
				
		int pageNo = 1;
			if(reqPage > 3) {
				pageNo = reqPage-2;
			}
				

		//페이지네비 생성 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//占쎌뵠占쎌읈 甕곤옙
		if(pageNo != 1) {
			pageNavi += "<a href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[占쎌뵠占쎌읈]</a>";
			}
			
			//占쎈읂占쎌뵠筌욑옙 占쎈떭占쎌쁽 占쎄문占쎄쉐
			for(int i=0;i<pageNaviSize;i++) {
			if(pageNo ==  reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</a>";
					}
			pageNo++;
			if(pageNo > totalPage) {
			 break;
				}
			}
			//占쎈뼄占쎌벉甕곌쑵�뱣
			if(pageNo<=totalPage) {
			 pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+" '>[占쎈뼄占쎌벉]</a>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";

			}
			
			//�럹�씠吏� �닽�옄 �깮�꽦
			for(int i=0; i<pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item active-page' href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>";
					pageNavi += pageNo;
					pageNavi += "</a></li>";
				}else {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>";
					pageNavi += pageNo;
					pageNavi += "</a></li>";
				}
				pageNo++;
				//for臾몄쓣 以묎컙�뿉 �깉異쒗빐�빞�븯�뒗 寃쎌슦媛� �엳�쓬 - �럹�씠吏�媛� �걹�굹硫� 洹� �씠�썑�럹�씠吏�(�뾾�뒗�럹�씠吏�)�뒗 異쒕젰X
				if(pageNo>totalPage) {
					break;
				}
			}
			
			//�떎�쓬踰꾪듉
			if(pageNo <= totalPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>";
				pageNavi += "<span class='material-icons'>chevron_right</span>";
				pageNavi += "</a></li>";
			}
			pageNavi += "</ul>";
			
			MemberPageData mpd = new MemberPageData(list,pageNavi);
			 return mpd;
			}

	
		

	
	
		/*
		//占쎌뵠占쎌읈 甕곌쑵�뱣
		if(pageNo != 1) {
		pageNavi += "<a href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[占쎌뵠占쎌읈]</a>";
		}
		
		//占쎈읂占쎌뵠筌욑옙 占쎈떭占쎌쁽 占쎄문占쎄쉐
		for(int i=0;i<pageNaviSize;i++) {
		if(pageNo ==  reqPage) {
			pageNavi += "<span>"+pageNo+"</span>";
		}else {
			pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</a>";
				}
		pageNo++;
		if(pageNo > totalPage) {
		 break;
			}
		}
		//占쎈뼄占쎌벉甕곌쑵�뱣
		if(pageNo<=totalPage) {
		 pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+" '>[占쎈뼄占쎌벉]</a>";
		}
		MemberPageData mpd = new MemberPageData(list,pageNavi);
		 return mpd;
		}
		 */
	}
	

