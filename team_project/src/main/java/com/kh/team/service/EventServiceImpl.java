package com.kh.team.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.EventDao;
import com.kh.team.vo.EventVo;
@Service
public class EventServiceImpl implements EventService {
	@Autowired
	EventDao eventDao;
	
	@Override
	public List<EventVo> getEventList() {
		
		return eventDao.getEventList();
	}

	@Override
	public boolean insertEvent(EventVo vo) {
		return eventDao.insertEvent(vo);
	}

	@Override
	public boolean updateEvent(EventVo vo) {
		return eventDao.updateEvent(vo);
	}

	@Override
	public boolean deleteEvent(int event_seq) {
		return eventDao.deleteEvent(event_seq);
	}

	@Override
	public List<EventVo> isEndEventList(String event_is_finish) {
		return eventDao.isEndEventList(event_is_finish);
	}

	@Override
	public EventVo getEventByEseq(int event_seq) {
		return eventDao.getEventByEseq(event_seq);
	}

}