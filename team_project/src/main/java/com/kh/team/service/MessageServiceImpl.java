package com.kh.team.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.MemberDao;
import com.kh.team.dao.MessageDao;
import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PagingDto;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageDao messageDao;

	@Override
	public boolean insertMessage(MessageVo messageVo) {
		boolean result = messageDao.insertMessage(messageVo);
		return result;
	}

	@Override
	public List<Integer> adminCheckSendedMessage() {
		List<Integer> list = messageDao.adminCheckSendedMessage();
		return list;
	}

	@Override
	public boolean insertNoBlackMessage(MessageVo messageVo) {
		return messageDao.insertNoBlackMessage(messageVo);
	}

	@Override
	public List<MessageVo> receivedMessageListById(String m_id) {
		List<MessageVo> receivedMessageList = messageDao.receivedMessageListById(m_id);
		return receivedMessageList;
	}

	@Override
	public List<MessageVo> sendMessageListById(String m_id) {
		List<MessageVo> sendMessageList = messageDao.sendMessageListById(m_id);
		return sendMessageList;
	}

	



}
