package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.BlackListVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;

public interface MemberService {
	public void insertMember(MemberVo memberVo); // 회원 추가
	public MemberVo getMemberByIdAndPw(String userid, String userpw);
	public List<MemberVo> getMemberList(); // 예약하기 페이지 - 운전자 리스트 가져오기 위한 메서드 (지금은 멤버로 하지만 추후 운전자 정보를 가지고 와야함)
	public List<MemberVo> admingetMemberList(PagingDto pagingDto); // 멤버 리스트
	public int adminGetCount(PagingDto pagingDto); // 관리자 회원관리 페이지 회원명 수 확인
	public MemberVo getMemberById(String m_id); // 예약하기 페이지 - 운전자 정보 가져오기 위한 메서드 (지금은 멤버로 하지만 추후 운전자 정보를 가지고 와야함)
	public boolean submitDriverLicense(String m_id, String ad_license_img); // 운전자 등록
}
