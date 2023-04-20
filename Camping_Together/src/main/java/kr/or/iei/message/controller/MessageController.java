package kr.or.iei.message.controller;

import com.google.gson.Gson;

import kr.or.iei.message.model.service.MessageService;
import kr.or.iei.message.model.vo.Message;
import lombok.Value;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;

	@RequestMapping(value = "/messageMain.do")
	public String messageMain() {
		return "message/messageMain";
	}

	@ResponseBody
	@RequestMapping(value = "/insertMessage.do")
	public String insertMessage(Message message) {
		int result = service.insertMessage(message);
		System.out.println(message);
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "/myMessageList.do")
	public String myMessageList(Message message) {
		ArrayList<Message> list = service.selectMessagelist(message);
		return "message/messageMain";
	}

	@ResponseBody
	@RequestMapping(value = "/messageDetail.do", produces = "application/json;charset=utf-8")
	public Message MessageDetail(Message message) {
		Message mg = service.selectOneMessage(message);
		
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateMessageReadStatus.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public int updateMessageReadStatus(@RequestBody Message message) {
		int result = service.updateMessageReadStatus(message);
		return result;
	}

}
