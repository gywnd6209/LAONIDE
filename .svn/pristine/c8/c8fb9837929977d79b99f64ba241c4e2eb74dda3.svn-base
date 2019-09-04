package kr.or.ddit.recruitboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.RecruitBoardVO;

public interface IRecruitboardService {
	public RecruitBoardVO recruitboardInfo(Map<String, String> params) throws Exception;
	public List<RecruitBoardVO> recruitboardList(Map<String, String> params) throws Exception;
	public int totalCount(Map<String, String> params) throws Exception;
	public String insertRecruitboardInfo(RecruitBoardVO recruitboardInfo) throws Exception;
	public String insertRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo) throws Exception;
	public void updateRecruitboardInfo(RecruitBoardVO recruitboardInfo) throws Exception;
	public int updateRecruitboardReplyInfo(RecruitBoardVO recruitboardInfo) throws Exception;
	public void deleteRecruitboardInfo(Map<String, String> params) throws Exception;
	public List<RecruitBoardVO> recruitboardReplyList(Map<String, String> params) throws Exception;
	public int totalCountReply(Map<String, String> params) throws Exception;
	public void updateHit(Map<String, String> params) throws Exception;
	public int pro_count(Map<String, String> params) throws Exception;
	public String id_nick(String mem_id) throws Exception;
}