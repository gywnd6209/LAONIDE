package kr.or.ddit.grand.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.GrandVO;
import kr.or.ddit.vo.RecruitBoardVO;

public interface IGrandService {
	public List<GrandVO> grandList() throws Exception;
}