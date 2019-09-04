package kr.or.ddit.crewInfo.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewInfoVO;
import kr.or.ddit.vo.ProInfoVO;
import kr.or.ddit.vo.RecruitBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ICrewInfoDaoImpl implements ICrewInfoDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public String insertCrewInfo(CrewInfoVO crewInfo)
			throws SQLException {
		String crew_no = "";
        try {
           client.startTransaction();

           crew_no = (String) client.insert("crewInfo.insertCrewInfo",crewInfo);
           
           client.commitTransaction();
        } finally {
           client.endTransaction();
        }
        return crew_no;
	}

	/**
	 * 	이슈트래커에서 팀원관리 게시판
	*/
	@Override
	public List<CrewInfoVO> crewList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("crewInfo.crewProInfo", params);
	}
	
	/**
	 * 	이슈트래커에서 팀원 -> 팀장 업그레이드
	*/
	@Override
	public void upPL(CrewInfoVO crewInfo) throws Exception {
		this.client.update("crewInfo.upPL",crewInfo);
	}

	@Override
	public void nonePL(CrewInfoVO crewInfo) throws Exception {
		this.client.update("crewInfo.nonePL",crewInfo);
	}

	/**
	 * 	이슈트래커에서 팀원 제거하기
	*/
	@Override
	public void deleteCrew(CrewInfoVO crewInfo) throws Exception {
		this.client.delete("crewInfo.deleteCrew", crewInfo);
		
	}
	
	@Override
	public List<CrewInfoVO> notInLoginID(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("crewInfo.notInLoginID", params);
	}
	@Override
	public List<CrewInfoVO> crewListByProLink(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("crewInfo.crewListByProLink", params);
	}

	/**
	 * 	팀원관리에서 팀원 초대하기
	*/
	@Override
	public void inviteCrew(CrewInfoVO crewInfo) throws Exception {
		this.client.insert("crewInfo.inviteCrew", crewInfo);
	}
	
	/**
	 * 	팀원관리에서 팀원 직책 설정하기
	*/
	@Override
	public void crewUpdateGrade(CrewInfoVO crewInfo) throws Exception {
		this.client.update("crewInfo.crewUpdateGrade",crewInfo);
	}

	/**
	 * 	프로젝트 삭제시 팀원 모두 삭제하기
	*/
	@Override
	public void deleteCrewAll(CrewInfoVO crewInfo) throws Exception {
		this.client.delete("crewInfo.deleteCrewAll", crewInfo);
	}

}
