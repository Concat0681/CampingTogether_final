package kr.or.iei.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.iei.camping.model.service.CampingService;

@Controller
public class CampingController {

	@Autowired
	private CampingService service;
}
