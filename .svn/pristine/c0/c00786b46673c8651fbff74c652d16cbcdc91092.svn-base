package kr.or.ddit.crewInfo.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.crewInfo.dao.ICrewInfoDao;
import kr.or.ddit.vo.CrewInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("ICrewInfoServiceImpl")
public class ICrewInfoServiceImpl implements ICrewInfoService {
	@Autowired
	private ICrewInfoDao dao;
		
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public String insertCrewInfo(CrewInfoVO crewInfo)
			throws Exception {
		String crew_no =null;
        try {
           
        	crew_no = dao.insertCrewInfo(crewInfo);
      
        } catch (SQLException e) {
         e.printStackTrace();
      }
		return crew_no;
	}

	/**
	 * 	이슈트래커에서 팀원관리 게시판
	*/
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CrewInfoVO> crewList(Map<String, String> params)
			throws Exception {
		return this.dao.crewList(params);
	}

	/**
	 * 	이슈트래커에서 팀원 -> 팀장 업그레이드
	*/
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void upPL(CrewInfoVO crewInfo) throws Exception {
		this.dao.upPL(crewInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void nonePL(CrewInfoVO crewInfo) throws Exception {
		this.dao.nonePL(crewInfo);		
	}

	/**
	 * 	이슈트래커에서 팀원 제거하기
	*/
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteCrew(CrewInfoVO crewInfo) throws Exception {
		this.dao.deleteCrew(crewInfo);
	}
	
	/**
	 * 알람소켓에서 해당 아이디를 제외한 프로젝트 팀원들 아이디 목록을 가져오기 위한 메서드
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CrewInfoVO> notInLoginID(Map<String, String> params)
			throws Exception {
		return this.dao.notInLoginID(params);
	}
	/**
	 * 채팅에서 글 뿌려주기 위한 메서드 추가
	 */
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public List<CrewInfoVO> crewListByProLink(Map<String, String> params)
			throws Exception {
		return this.dao.crewListByProLink(params);
	}

	/**
	 * 	팀원관리에서 팀원 초대하기
	*/
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void inviteCrew(CrewInfoVO crewInfo) throws Exception {
		this.dao.inviteCrew(crewInfo);
	}

	/**
	 * 	팀원관리에서 팀원 직책 설정하기
	*/
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void crewUpdateGrade(CrewInfoVO crewInfo) throws Exception {
		this.dao.crewUpdateGrade(crewInfo);
	}

	/**
	 * 	프로젝트 삭제시 팀원 모두 삭제하기
	*/
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void deleteCrewAll(CrewInfoVO crewInfo) throws Exception {
		this.dao.deleteCrewAll(crewInfo);
	}

}
