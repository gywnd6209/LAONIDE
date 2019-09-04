package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitBoardVO;

/**
 * 데이터 접근용 interface
 * 
 * @author Administrator
 */
public interface MemberDao {
//	상세정보
	public MemberVO memberInfo(Map<String, String> params) throws SQLException;
//	회원 리스트
	public List<MemberVO> memberList(Map<String, String> params) throws SQLException;
//	회원가입
	public void insertMember(MemberVO memberInfo) throws SQLException;
//	프로필에서 정보수정
//	public int updateProfile(Map<String, String> params) throws Exception;
	public int updateProfile(MemberVO memberInfo) throws Exception;
//	회원 탈퇴처리
	public int deleteMember(Map<String, String> params) throws SQLException;
//	회원 다중삭제
	public int deleteChecked(Map<String, String> params) throws Exception;
//	회원 정보 수정
	public void updateMember(MemberVO memberInfo) throws SQLException;
//	아이디 중복확인
	public MemberVO idChk(Map<String, String> params) throws SQLException;
//	닉네임 중복확인
	public MemberVO nickChk(Map<String, String> params) throws SQLException;
//	페이지네이션 카운트
	public int totalCount(Map<String, String> params) throws SQLException;
//	비밀번호 수정
	public int updatePass(MemberVO memberInfo) throws SQLException;
	

//  관리자, 회원상세정보
	public MemberVO memberInfo_all(Map<String, String> params) throws SQLException;
// 아이디 찾기
	public MemberVO memberInfo_id(Map<String, String> params) throws SQLException;
// 비밀번호 찾기
	public MemberVO memberInfo_pw(Map<String, String> params) throws SQLException;
// 임시비번 업데이트
	public int updateMember_pw(Map<String, String> params) throws SQLException;
// 카톡 회원 확인
	public MemberVO memberKtInfo(Map<String, String> params) throws SQLException;
//	카카오톡 회원가입
	public void insertKt(MemberVO memberKt) throws SQLException;
//	카톡 회원가입 닉네임 중복확인
	public MemberVO ktnickInfo(Map<String, String> params) throws SQLException;
//	카톡 회원가입 이메일 중복확인
	public MemberVO ktmailInfo(Map<String, String> params) throws SQLException;
	
//	public MemberVO authenticate(String str) throws Exception;
//	public void createAuthKey(String memberEmail, String memberAuthKey) throws Exception;
//	public MemberVO chkAuth(MemberVO vo) throws Exception;
//	public void userAuth(MemberVO vo) throws Exception;
}
