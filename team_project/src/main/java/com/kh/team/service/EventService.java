package com.kh.team.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kh.team.vo.EventParticipationVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.PagingDto;

public interface EventService {
	public List<EventVo> getEventList();
	public boolean insertEvent(@Param("param")EventVo param);
	public boolean updateEvent(EventVo eventVo);
	public boolean deleteEvent(int event_seq);
	public List<EventVo> isEndEventList(String event_is_finish);
	public EventVo getEventByEseq(int event_seq);
	public int getCountEvent(); // 이벤트 수 확인
	public List<EventVo> getEventMainList(PagingDto pagingDto);
	public void updateEventFinish(int event_seq);
	public String getContent(int event_seq); 
	
	//이벤트 참가 테이블
	public void createTableEvnet(int event_seq);

	public void createSeqParticipation(int event_seq);

	public boolean insertParticipation(String m_id, int event_seq);

	public boolean updateParticipation(String m_id, int event_seq);
	
	public List<EventParticipationVo> getListParticipationByEventSeq(int event_seq);
	
	public int getMaxNoFinishEventSeq();
	
	public List<Map<String, Object>> getJoinEventData(int event_seq);
	
	//이벤트 테이블 관리
	public List<Integer> selectAllEventList();

	public List<Integer> selectEndEventList();

	public List<Integer> selectLiveEventList();
	public int selectEventMaxCount(int event_seq);
	public boolean updateIsLot(int event_seq);
	public boolean updateEventWinnerToParticipation(int event_seq,String m_id);
	public boolean updateEventWinnerPoint(String m_id,String pc_code);
	public boolean insertEventWinnerPointHistory(String m_id,String pc_code);
	public boolean transactionEventUpdate(int event_seq,String m_id, String pc_code);
	
}
