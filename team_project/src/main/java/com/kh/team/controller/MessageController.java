package com.kh.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MessageService;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/recAdminMessagePage", method= RequestMethod.GET)
	public String receivedMessagePage(HttpSession session)	{
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> recAdminMessageList = messageService.recAdminMessageListById(loginVo.getM_id());
		session.setAttribute("recAdminMessageList", recAdminMessageList);
		return "/message/receive_admin";
	}
	
	@RequestMapping(value="/recUserMessagePage", method= RequestMethod.GET)
	public String recUserMessagePage(HttpSession session)	{
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> recUserMessageList = messageService.recUserMessageListById(loginVo.getM_id());
		session.setAttribute("recUserMessageList", recUserMessageList);
		return "/message/receive_user";
	}
	
	@RequestMapping(value="/sendMessagePage", method= RequestMethod.GET)
	public String sendMessagePage(HttpSession session)	{
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		List<MessageVo> sendMessageList = messageService.sendMessageListById(loginVo.getM_id());
		session.setAttribute("sendMessageList", sendMessageList);
		return "/message/send";
	}
	
	@RequestMapping(value="/send", method= RequestMethod.POST)
	public String send(MessageVo messageVo, HttpServletRequest request, RedirectAttributes rttr) {
		boolean result = messageService.insertNoBlackMessage(messageVo);
		System.out.println(result);
		rttr.addFlashAttribute("send_result", result);
		String prevUrl = request.getHeader("referer");
		String prevUri = prevUrl.substring(16);
		return "redirect:" + prevUri;
	}
	
	@ResponseBody
	@RequestMapping(value="/notifyComplete", method= RequestMethod.POST)
	public String notifyComplete(MessageVo messageVo) {
//		System.out.println("messageVo1 : " + messageVo);
		boolean result1 = messageService.insertMessage(messageVo);
		if (messageVo.getReceiver_black_id() != null && !messageVo.getReceiver_black_id().equals("")) {
			messageVo.setReceiver_m_id(messageVo.getReceiver_black_id());
//			System.out.println("messageVo2 : " + messageVo);
			boolean result2 = messageService.insertMessage(messageVo);
			if (result1 == true && result2 == true) {
				result1 = true;
			}
		}
		return String.valueOf(result1);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkSendedMessage", method= RequestMethod.POST)
	public List<Integer> checkSended() {
		List<Integer> list = messageService.adminCheckSendedMessage();
		System.out.println("list : " + list);
		return list;
	}
	
	//add event 메세지
	@ResponseBody
	@RequestMapping(value="/EventIsNoGet", method= RequestMethod.POST)
	public String notifyEventIsNoGet(MessageVo messageVo) {
		System.out.println("messageVo : " + messageVo);
		boolean result = messageService.insertNoBlackMessage(messageVo);
		return String.valueOf(result);
	}
}
