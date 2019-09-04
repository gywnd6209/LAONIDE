package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.RecruitBoardVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberDao dao;
	
	public MemberServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//비밀번호 수정하기
	@Override
	public int updatePass(MemberVO memberInfo) {
		int updateCnt = 0;
		try {
			updateCnt = dao.updatePass(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return updateCnt;
	}
	
	//회원정보 상세보기
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.memberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo;
	}
	
	//회원 목록
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws SQLException {
//		List<MemberVO> memberList = null;
//		try {
//			memberList = dao.memberList();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		return this.dao.memberList(params);
	}
	
	//회원 가입
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertMember(MemberVO memberInfo) {
		try {
			dao.insertMember(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//회원 탈퇴
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteMember(Map<String, String> params) {
		int deleteCnt = 0;
		try {
			deleteCnt = dao.deleteMember(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return deleteCnt;
	}

	//회원 다중삭제
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int deleteChecked(Map<String, String> params) throws Exception{
		int deleteCnt = 0;
		
		deleteCnt = dao.deleteChecked(params);
		
		return deleteCnt;
	}
	
	//프로필에서 수정
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
//	public int updateProfile(Map<String, String> params) throws Exception{
	public int updateProfile(MemberVO memberInfo){
		int Cnt = 0;
		
		try {
			Cnt = dao.updateProfile(memberInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Cnt;
	}
	
	//회원 정보수정(비번 제외)
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void updateMember(MemberVO memberInfo) {
		int updateCnt = 0;
		try {
			 dao.updateMember(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
//	//닉네임 중복확인
//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
//	@Override
//	public int nickChk(MemberVO memberInfo) {
//		int cnt = 0;
//		try {
//			cnt = dao.nickChk(memberInfo);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return cnt;
//	}
	
	
	//id중복확인
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO idChk(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.idChk(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo;
	}
	
	//닉네임 중복확인
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO nickChk(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.nickChk(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo;
	}
	

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo_id(Map<String, String> params) {
		MemberVO memberInfo_id = null;
		try {
			memberInfo_id = dao.memberInfo_id(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo_id;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo_pw(Map<String, String> params) {
		MemberVO memberInfo_pw = null;
		try {
			memberInfo_pw = dao.memberInfo_pw(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo_pw;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public int updateMember_pw(Map<String, String> params) {
		int cnt = 0;
		try {
			
			 cnt = dao.updateMember_pw(params);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberKtInfo(Map<String, String> params) {
		MemberVO memberKtInfo = null;
		try {
			memberKtInfo = dao.memberKtInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberKtInfo;
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertKt(MemberVO memberKt) {
		try {
			dao.insertKt(memberKt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO ktnickInfo(Map<String, String> params) {
		MemberVO ktnickInfo = null;
		try {
			ktnickInfo = dao.ktnickInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ktnickInfo;
	}
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO ktmailInfo(Map<String, String> params) {
		MemberVO ktmailInfo = null;
		try {
			ktmailInfo = dao.ktmailInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ktmailInfo;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return this.dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public MemberVO memberInfo_all(Map<String, String> params) {
		MemberVO memberInfo_all = null;
		try {
			memberInfo_all = dao.memberInfo_all(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo_all;
	}


}
