package kr.or.iei.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.iei.reservation.model.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
}
