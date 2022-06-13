package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.ComplainVo;

@Repository
public class ComplainDaoImpl implements ComplainDao {
	private final String NAMESPACE="com.kh.team.mappers.complain.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertComplain(ComplainVo complainVo) {
//		System.out.println("complainVo : " + complainVo);
		int count = sqlSession.insert(NAMESPACE + "insertComplain", complainVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<ComplainVo> getFinishListById(String m_id) {
		List<ComplainVo> complainList = sqlSession.selectList(NAMESPACE + "getFinishListById", m_id);
		return complainList;
	}
	
	@Override
	public List<ComplainVo> getNotFinishListById(String m_id) {
		List<ComplainVo> complainList = sqlSession.selectList(NAMESPACE + "getFinishListById", m_id);
		return complainList;
	}

}
