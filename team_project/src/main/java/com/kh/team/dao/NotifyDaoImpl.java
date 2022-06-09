package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.BlackListVo;

@Repository
public class NotifyDaoImpl implements NotifyDao{
	private final String NAMESPACE = "com.kh.team.mappers.notify.";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertNotification(BlackListVo blackListVo) {
		sqlSession.insert(NAMESPACE + "insertNotification", blackListVo);
	}

	@Override
	public List<BlackListVo> notifyList() {
		List<BlackListVo> list = sqlSession.selectList(NAMESPACE + "notifyList");
		return list;
	}

	@Override
	public int notifyCount() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "notifyCount");
		return count;
	}

	@Override
	public int totalNotifyCount() {
		int totalCount = (int)sqlSession.selectOne(NAMESPACE + "totalNotifyCount");
		return totalCount;
	}

	@Override
	public List<BlackListVo> yNotifyList() {
		List<BlackListVo> yNotifyList = sqlSession.selectList(NAMESPACE + "yNotifyList");
		return yNotifyList;
	}

	@Override
	public List<BlackListVo> nNotifyList() {
		List<BlackListVo> nNotifyList = sqlSession.selectList(NAMESPACE + "nNotifyList");
		return nNotifyList;
	}

	@Override
	public List<BlackListVo> dayNotifyList() {
		List<BlackListVo> dayNotifyList = sqlSession.selectList(NAMESPACE + "dayNotifyList");
		return dayNotifyList;
	}

	@Override
	public int dayNotifyCount() {
		int dayNotifyCount = (int)sqlSession.selectOne(NAMESPACE + "dayNotifyCount");
		return dayNotifyCount;
	}

	@Override
	public void modifyApprovement(BlackListVo blackListVo) {
		sqlSession.update(NAMESPACE + "modifyApprovement", blackListVo);
	}

}
