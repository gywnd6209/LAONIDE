package kr.or.ddit.freeboardfile.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeboardFileVO;
import kr.or.ddit.vo.FreeboardVO;

@Repository
public class FreeboardFileDaoImpl implements FreeboardFileDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public FreeboardFileVO fileItemInfo(Map<String, String> params)
			throws Exception {
		return (FreeboardFileVO) this.client.queryForObject("freeboardFileitem.freefileItemInfo", params);
	}

	@Override
	public List<FreeboardFileVO> fileItemList(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFileItem(List<FreeboardFileVO> fileItemList, String bo_no)
			throws Exception {
		for (FreeboardFileVO fileItemInfo : fileItemList) {
			fileItemInfo.setFile_bo_no(bo_no);
			client.insert("freeboardFileitem.freeinsertFileItem", fileItemInfo);
		}
		
	}

	@Override
	public void updateFileItem(FreeboardFileVO fileItemInfo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFileItem(Map<String, String> params) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
