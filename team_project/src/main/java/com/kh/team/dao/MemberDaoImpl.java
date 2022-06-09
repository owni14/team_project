package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	private final String NAMESPACE = "com.kh.team.mappers.member.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
		
	}

	@Override
	public MemberVo getMemberByIdAndPw(String m_id, String m_pw) {
		Map<String, String> parameter = new HashMap<String, String>();
		parameter.put("m_id", m_id);
		parameter.put("m_pw", m_pw);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberByIdAndPw", parameter);
		return memberVo;
	}

	@Override
	public List<MemberVo> admingetMemberList(PagingDto pagingDto) {
		List<MemberVo> memberList = sqlSession.selectList(NAMESPACE + "admingetMemberList", pagingDto);
		return memberList;
	}

	@Override
	public List<Map<String, Object>> getDriverList(String m_company) {
		List<Map<String, Object>> driverList = sqlSession.selectList(NAMESPACE + "getDriverList", m_company);
		return driverList;
	}

	@Override
	public int adminGetCount(PagingDto pagingDto) {
		int count = (int)sqlSession.selectOne(NAMESPACE + "adminGetCount", pagingDto); 
		return count;
	}

	@Override
	public MemberVo getDriverById(String m_id) {
		MemberVo driverInfo = sqlSession.selectOne(NAMESPACE + "getDriverById", m_id);
//		System.out.println("driverInfo:" + driverInfo);
		return driverInfo;
	}
	
	@Override
	public MemberVo getMemberPointById(String m_id) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "getMemberPointById");
		return memberVo;
	}

	// 운전자 등록을 위한 메서드
	@Override
	public boolean insertDriverLicense(String m_id, String ad_license_img) {
		Map<String, String> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("ad_license_img", ad_license_img);
		int result = sqlSession.insert(NAMESPACE + "insertDriverLicense", map);
		if (result > 0) {
			return true;
		}
		return false;
	}

}
