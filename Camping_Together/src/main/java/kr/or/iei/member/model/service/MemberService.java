package kr.or.iei.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;

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

	
	//�쉶�썝�깉�눜
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}
	
	public MemberPageData selectPayList(int memberNo,int reqPage) {
		int numPerpage = 5;
		
		//reqPage = 1 -> 1~2,  reqPage = 2 -> 2~3
		int end = reqPage * numPerpage;
		int start = end - numPerpage + 1;
		
		//怨꾩궛�맂 start, end瑜� 媛�吏�怨� 寃뚯떆臾� 紐⑸줉 議고쉶
		//Mybatis�뒗 留ㅺ컻蹂��닔�뒗 �븳媛쒕쭔 �꽕�젙�씠 媛��뒫 -> �븘�슂�븳 媛믪씠 �뿬�윭媛쒕㈃ 1媛쒕줈 臾띠뼱�빞�븿 (vo�삉�뒗 map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end",end);
		map.put("memberNo", memberNo);
		
		ArrayList<CampingPayment> list = dao.selectPayList(map);
		
		//pageNavi �젣�옉 �떆�옉
		//�쟾泥� 寃뚯떆臾� �닔 �븘�슂 -> �쟾泥� 寃뚯떆臾� �닔 議고쉶 
		System.out.println(memberNo);
		int totalCount = dao.selectPayListCount(memberNo);
		
		//�쟾泥닿쾶�떆臾쇰줈 �쟾泥� �럹�씠吏� �닔 怨꾩궛
		int totalPage = (int)Math.ceil(totalCount/(double)numPerpage);
		
		
		//pageNavi�궗�씠利�
		int pageNaviSize = 5;
				
		int pageNo = 1;
			if(reqPage > 3) {
				pageNo = reqPage-2;
			}
				


		//페이지네비 생성 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//�씠�쟾 踰�
		if(pageNo != 1) {
			pageNavi += "<a href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[�씠�쟾]</a>";
			}
			
			//�럹�씠吏� �닽�옄 �깮�꽦
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
			//�떎�쓬踰꾪듉
			if(pageNo<=totalPage) {
			 pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+" '>[�떎�쓬]</a>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";

			}
			
			//페이지 숫자 생성
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
				//for문을 중간에 탈출해야하는 경우가 있음 - 페이지가 끝나면 그 이후페이지(없는페이지)는 출력X
				if(pageNo>totalPage) {
					break;
				}
			}
			
			//다음버튼
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

	public MimeMessage createMimeMessage() {
		// TODO Auto-generated method stub
		return null;
	}

	
		

	
	
		/*
		//�씠�쟾 踰꾪듉
		if(pageNo != 1) {
		pageNavi += "<a href='/cmapingPayList.do?reqPage="+(pageNo-1)+"&memberNo="+memberNo+"'>[�씠�쟾]</a>";
		}
		
		//�럹�씠吏� �닽�옄 �깮�꽦
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
		//�떎�쓬踰꾪듉
		if(pageNo<=totalPage) {
		 pageNavi += "<a href='/cmapingPayList.do?reqPage="+pageNo+"&memberNo="+memberNo+" '>[�떎�쓬]</a>";
		}
		MemberPageData mpd = new MemberPageData(list,pageNavi);
		 return mpd;
		}
		 */
	}
	

