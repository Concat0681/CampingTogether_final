package kr.or.iei.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.or.iei.camping.model.vo.CampingRoomFileVO;
import kr.or.iei.shop.model.service.ShopService;
import kr.or.iei.shop.model.vo.Shop;
import kr.or.iei.shop.model.vo.ShopPhoto;

@Controller
public class ShopController {

	@Autowired
	private ShopService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/shopMainList.do")
	public String shopList(Model model) {
		int start = 1;
		int end = 8;
		for(int campingCategory=0;campingCategory<3;campingCategory++) {
			ArrayList<Shop> list = service.selectShopList(campingCategory, start, end);
			model.addAttribute("list"+campingCategory, list);
		}
		return "shop/shopMainList";
	}
	
	@RequestMapping(value="/insertShopFrm.do")
	public String insertShopFrm() {
		return "shop/insertShopFrm";
	}
	
	@Transactional
	@RequestMapping(value="/insertShop.do")
	public String insertShop(Shop shop,  MultipartFile[] shopFileList, HttpServletRequest requset) {
		System.out.println(shop);
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
}
