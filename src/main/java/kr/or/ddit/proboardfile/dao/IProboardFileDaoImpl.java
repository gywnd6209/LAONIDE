package kr.or.ddit.proboardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProBoardFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
@Repository
public class IProboardFileDaoImpl implements IProboardFileDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public ProBoardFileVO proFileItemInfo(Map<String, String> params)
			throws Exception {
		return (ProBoardFileVO) this.client.queryForObject("proboradFileitem.proFileItemInfo",params);
	}

	@Override
	public List<ProBoardFileVO> proFileItemList(Map<String, String> params)
			throws Exception {
		return (List<ProBoardFileVO>) this.client.queryForObject("proboradFileitem.proFileItemInfo", params);
	}

	@Override
	public void insertProFileItem(List<ProBoardFileVO> fileItemList,
			String bo_no) throws Exception {
		for(ProBoardFileVO fileItemInfo : fileItemList){
			fileItemInfo.setFile_bo_no(bo_no);
			client.insert("proboradFileitem.insertProFileItem", fileItemInfo);
		}
		
	}

	@Override
	public void updateProFileItem(ProBoardFileVO fileItemInfo) throws Exception {
	}

	@Override
	public void deleteProFileItem(Map<String, String> params) throws Exception {
	}

}
