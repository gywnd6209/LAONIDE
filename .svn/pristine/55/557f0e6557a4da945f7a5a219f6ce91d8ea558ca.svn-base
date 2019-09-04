package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.MemberVO;
//public class IMemberDaoImpl implements IMemberDao,
//ApplicationContextAware{

//<bean name="iMemberDao"
//class="kr.or.ddit.member.dao.IMemberDaoImpl"/>
@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Resource
	private SqlMapClient client;
	
	public MemberDaoImpl() {
		
	}
	
	//회원 상세정보
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}
	
	//id중복확인
	@Override
	public MemberVO idChk(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.idChk", params);
	}
	
	//닉네임 중복확인
	@Override
	public MemberVO nickChk(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.nickChk", params);
	}
	
	//회원 리스트
	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws SQLException {
		return this.client.queryForList("member.memberList", params);
	}
	
	//회원가입
	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		client.insert("member.insertMember", memberInfo);
	}
	
	//회원 삭제
	@Override
	public int deleteMember(Map<String, String> params) throws SQLException {
		return client.delete("member.deleteMember", params);
	}
	
	//회원 다중삭제
	@Override
	public int deleteChecked(Map<String, String> params) throws Exception {
		return client.update("member.deleteChecked", params);
	}
	//프로필에서 회원정보수정
	@Override
//	public int updateProfile(Map<String, String> params) throws Exception {
	public int updateProfile(MemberVO memberInfo) throws Exception {
//		return client.update("member.updateProfile", memberInfo);
		return client.update("member.updateMember", memberInfo);
	}

	//회원정보 수정(비밀번호 제외)
	@Override
	public void updateMember(MemberVO memberInfo) throws SQLException {
		 this.client.update("member.updateMember", memberInfo);
	}
	
	//비밀번호만 수정
	@Override
	public int updatePass(MemberVO memberInfo) throws SQLException {
		return client.update("member.updatePass", memberInfo);
	}


	@Override
	public MemberVO memberInfo_id(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo_id", params);
	}

	@Override
	public MemberVO memberInfo_pw(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo_pw", params);
	}

	@Override
	public int updateMember_pw(Map<String, String> params) throws SQLException {
		return client.update("member.updateMember_pw", params);
	}

	@Override
	public MemberVO memberKtInfo(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberKtInfo", params);
	}

	@Override
	public void insertKt(MemberVO memberKt) throws SQLException {
		client.insert("member.insertKt", memberKt);
	}

	@Override
	public MemberVO ktnickInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.ktnickInfo", params);
	}
	
	@Override
	public MemberVO ktmailInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.ktmailInfo", params);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) this.client.queryForObject("member.totalCount", params);
	}

	@Override
	public MemberVO memberInfo_all(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo_all", params);
	}


}
