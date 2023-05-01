package kr.or.iei.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.iei.shop.model.service.ShopService;
import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopBasket;
import kr.or.iei.shop.model.vo.ShopListMainData;
import kr.or.iei.shop.model.vo.ShopOrder;
import kr.or.iei.shop.model.vo.ShopPayment;
import kr.or.iei.shop.model.vo.ShopPhoto;
import kr.or.iei.shop.model.vo.ShopReview;
import kr.or.iei.shop.model.vo.ShopReviewListData;
import kr.or.iei.shop.model.vo.ShopReviewPhoto;

@Controller
public class ShopController {

	@Autowired
	private ShopService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/mainShopList.do")
	public String mainShopList(Model model) {
		 int reqPage = 1;
		    String order = "avgReviewRating";
		    int numPerPage = 5;
			for(int shopCategory=0;shopCategory<3;shopCategory++) {
				ShopListMainData slmd = service.selectShopList(shopCategory, reqPage, order, numPerPage);
				if(shopCategory == 0) {
					model.addAttribute("campingList", slmd.getShopList());
					model.addAttribute("campingPageNavi", slmd.getPageNavi());
				} else if(shopCategory == 1) {
					model.addAttribute("carList", slmd.getShopList());
					model.addAttribute("carPageNavi", slmd.getPageNavi());
				} else {
					model.addAttribute("etcList", slmd.getShopList());
					model.addAttribute("etcPageNavi", slmd.getPageNavi());
				}
			}
			return "shop/mainShopList";
	}
	
	@RequestMapping(value="/shopMainList.do")
	public String shopMainList(Model model) {
	    int reqPage = 1;
	    String order = "new";
	    int numPerPage = 8;
		for(int shopCategory=0;shopCategory<3;shopCategory++) {
			ShopListMainData slmd = service.selectShopList(shopCategory, reqPage, order, numPerPage);
			if(shopCategory == 0) {
				model.addAttribute("campingList", slmd.getShopList());
				model.addAttribute("campingPageNavi", slmd.getPageNavi());
				model.addAttribute("campingTotal", slmd.getTotalCount());
			} else if(shopCategory == 1) {
				model.addAttribute("carList", slmd.getShopList());
				model.addAttribute("carPageNavi", slmd.getPageNavi());
				model.addAttribute("carTotal", slmd.getTotalCount());
			} else {
				model.addAttribute("etcList", slmd.getShopList());
				model.addAttribute("etcPageNavi", slmd.getPageNavi());
				model.addAttribute("etcTotal", slmd.getTotalCount());
			}
		}
		return "shop/shopMainList";
	}
	
	@ResponseBody
	@RequestMapping(value="/shopListByOrder.do", produces="application/json;charset=utf-8")
	public String shopListByOrder(int shopCategory, int reqPage, String order) {
		int numPerPage = 8;
		ShopListMainData slmd = service.selectShopList(shopCategory, reqPage , order, numPerPage);
		return new Gson().toJson(slmd);
	}
	
	@RequestMapping(value="/shopList.do")
	public String shopList(int shopCategory, int reqPage) {
		return "shop/shopList";
	}
	
	@RequestMapping(value="/insertShopFrm.do")
	public String insertShopFrm() {
		return "shop/insertShopFrm";
	}
	
	@Transactional
	@RequestMapping(value="/insertShop.do")
	public String insertShop(Shop shop,  MultipartFile[] shopFileList, HttpServletRequest requset) {
		int result = service.insertShop(shop);
		int finalResult = 1;
		if(result > 0) {
			ArrayList<ShopPhoto> photoList = new ArrayList<ShopPhoto>();
			if(!shopFileList[0].isEmpty()) {
				String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/shop/");
				for(MultipartFile file : shopFileList) {
					String filepath = manager.upload(savePath, file);
					ShopPhoto shopPhoto = new ShopPhoto();
					shopPhoto.setFilepath(filepath);
					photoList.add(shopPhoto);
				}
			}
			int shopNo = service.selectLatestShop();
			for( ShopPhoto sp : photoList) {
				int photoResult = service.insertShopPhoto(sp.getFilepath(), shopNo);
				if(photoResult == 0) {
					finalResult = 0;
				}
			}
		}
		if(finalResult > 0) {
			return "redirect:/shopMainList.do";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/updateShopFrm.do")
	public String updateShopFrm(int shopNo, Model model) {
		String memberId = null;
		Shop shop = service.selectOneShop(shopNo, memberId);
		model.addAttribute("shop", shop);
		return "shop/updateShopFrm";
	}
	
	@Transactional
	@RequestMapping(value="/updateShop.do")
	public String updateShop(Shop shop, String delPhotoList, MultipartFile[] shopFileList, HttpServletRequest requset) {
		int shopResult = service.updateShop(shop);
		String savePath = requset.getSession().getServletContext().getRealPath("/resources/upload/shop/");
		int finalResult = 1;
		Boolean delResult = true;
		if(shopResult > 0) {
			ArrayList<ShopPhoto> delList = new ArrayList<ShopPhoto>();
			if(delPhotoList != null) {
				String[] arr1 = delPhotoList.split(",");
				for(String delFilepath : arr1 ) {
					Boolean result = manager.deleteFile(savePath, delFilepath);
					if(!result) {
						delResult = false;
					} else {
						ShopPhoto sp = new ShopPhoto();
						sp.setFilepath(delFilepath);
						sp.setShopNo(shop.getShopNo());
						delList.add(sp);
					}
				}
				for(ShopPhoto sp : delList) {
					int delSrp = service.deleteShopPhoto(sp);
				}
			}
			ArrayList<ShopPhoto> photoList = new ArrayList<ShopPhoto>();
			if(!shopFileList[0].isEmpty()) {
				for(MultipartFile file : shopFileList) {
					String filepath = manager.upload(savePath, file);
					ShopPhoto shopPhoto = new ShopPhoto();
					shopPhoto.setFilepath(filepath);
					photoList.add(shopPhoto);
				}
			}
			for( ShopPhoto sp : photoList) {
				int photoResult = service.insertShopPhoto(sp.getFilepath(), shop.getShopNo());
				if(photoResult == 0) {
					finalResult = 0;
				}
			}
		}
		if(finalResult > 0) {
			return "redirect:/viewShop.do?shopNo="+shop.getShopNo()+"&reqPage=1&menu=0&memberId="+shop.getMemberId();
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/deleteShop.do")
	public String deleteShop(int shopNo) {
		int result = service.deleteShop(shopNo);
		return "redirect:/shopMainList.do";
	}
	
	@RequestMapping(value="/viewShop.do")
	public String viewShop(int shopNo, int reqPage, int menu, String memberId, Model model) {
		ShopOrder shopOrder = null;
		if(memberId != null) {
			shopOrder = service.selectMyOrder(memberId, shopNo);
		}
		Shop shop = service.selectOneShop(shopNo, memberId);
		System.out.println(shop);
		ShopReviewListData srld = service.selectShopReviewList(shopNo, reqPage);
		model.addAttribute("shop", shop);
		model.addAttribute("menu", menu);
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("shopOrder", shopOrder);
		model.addAttribute("shopReviewList", srld.getShopReviewList());
		model.addAttribute("reviewPageNavi", srld.getReviewPageNavi());
		return "shop/viewShop";
	}
	
	@Transactional
	@RequestMapping(value="/updateShopComment.do")
	public String updateShopComment(ShopReview sr, int reqPage, String delPhotoList, MultipartFile[] photoList, HttpServletRequest request) {
		ArrayList<ShopReviewPhoto> delList = new ArrayList<ShopReviewPhoto>();
		ArrayList<ShopReviewPhoto> srpList = new ArrayList<ShopReviewPhoto>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/shopReview/");
		Boolean delResult = true;
		int reviewResult = service.updateShopReview(sr);
		if(delPhotoList != null) {
			String[] arr1 = delPhotoList.split(",");
			for(String delFilepath : arr1 ) {
				Boolean result = manager.deleteFile(savePath, delFilepath);
				if(!result) {
					delResult = false;
				} else {
					ShopReviewPhoto srp = new ShopReviewPhoto();
					srp.setFilepath(delFilepath);
					srp.setShopReviewNo(sr.getShopReviewNo());
					delList.add(srp);
				}
			}
			for(ShopReviewPhoto srp : delList) {
				int delSrp = service.deleteShopReviewPhoto(srp);
			}
		}
		if(!photoList[0].isEmpty()) {
			for(MultipartFile file : photoList) {
				String filepath = manager.upload(savePath, file);
				ShopReviewPhoto srp = new ShopReviewPhoto();
				srp.setFilepath(filepath);
				srp.setShopReviewNo(sr.getShopReviewNo());
				srpList.add(srp);
			}
		}
		for(ShopReviewPhoto srp : srpList) {
			int photoResult = service.insertShopReviewPhoto(srp);
		}
			
		return "redirect:/viewShop.do?shopNo="+sr.getShopNo()+"&reqPage="+reqPage+"&menu=1";
	}

	@Transactional
	@ResponseBody
	@RequestMapping(value="/insertShopReview.do")
	public String insertShopReview(ShopReview sr, MultipartFile[] photoList, HttpServletRequest request ) {
		sr.setMemberId("user01");
		int result = service.insertShopReview(sr);
		int finalResult = 1;
		ArrayList<ShopReviewPhoto> srpList = new ArrayList<ShopReviewPhoto>();
		if(result > 0 ) {
			if(!photoList[0].isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/shopReview/");
				for(MultipartFile file : photoList) {
					String filepath = manager.upload(savePath, file);
					ShopReviewPhoto srp = new ShopReviewPhoto();
					srp.setFilepath(filepath);
					srpList.add(srp);
				}
			}
			int shopReviewNo = service.selectLatestShopReview();
			for(ShopReviewPhoto srp : srpList) {
				srp.setShopReviewNo(shopReviewNo);
				int photoResult = service.insertShopReviewPhoto(srp);
				if(photoResult == 0) {
					finalResult = 0;
				}
			}
		}
		if(finalResult > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/insertBasket.do")
	public String insertBasket(ShopBasket basket) {
		ShopBasket b = service.selectMyBasket(basket);
		if(b == null) {
			int result = service.insertBasket(basket);
			if(result > 0) {
				return "ok";
			} else {
				return "fail";
			}
		} else {
			return "exist";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteShopReview.do")
	public String deleteShopReview(int shopReviewNo,  HttpServletRequest request ) {
		int result = service.deleteShopReview(shopReviewNo);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/shopReview/");
		if(result > 0) {
			ArrayList<ShopReviewPhoto> photoList = service.selectOneShopReviewPhoto(shopReviewNo);
			for(ShopReviewPhoto srp : photoList) {
				manager.deleteFile(savePath, srp.getFilepath());
			}
			return "success";
		} else {
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/insertShopOrder.do")
	public String insertShopOrder(ShopOrder so, ShopPayment spm, int shopNo) {
		int result = service.insertShopOrder(so, spm, shopNo);
		if(result > 0) {
			return "success";
		} else {
			return "error";
		}
	}

}
