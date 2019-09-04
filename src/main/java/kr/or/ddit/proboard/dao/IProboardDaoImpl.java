package kr.or.ddit.proboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.proboardfile.dao.IProboardFileDao;
import kr.or.ddit.vo.ProBoardFileVO;
import kr.or.ddit.vo.ProBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
 
@Repository
public class IProboardDaoImpl implements IProboardDao {
	@Autowired
	private SqlMapClient client;
	@Autowired
	private IProboardFileDao fileitemdao;

	@Override
	public ProBoardVO proboardInfo(Map<String, String> params) throws Exception {
		return (ProBoardVO) client.queryForObject("proboard.proboardInfo",params);
	}

	@Override
	public List<ProBoardVO> proboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("proboard.proboardList", params);
	}

	@Override
	public String insertProBoardInfo(ProBoardVO proboardInfo,  List<ProBoardFileVO> fileItemList) throws Exception {
		String bo_no="";
		try {
			client.startTransaction();
			bo_no = (String) client.insert("proboard.insertProboard", proboardInfo);
			fileitemdao.insertProFileItem(fileItemList, bo_no);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return bo_no;
	}

	@Override
	public void updateProBoardInfo(ProBoardVO proboardInfo) throws Exception {
		client.update("proboard.updateProboard", proboardInfo);
	}

	@Override
	public void deleteProBoardInfo(Map<String, String> params) throws Exception {
		client.update("proboard.deleteProboard", params);
		
	}

	@Override
	public String insertProBoardReplyInfo(ProBoardVO proboardInfo)
			throws Exception {
		String bo_no = "";
		try {
			client.startTransaction();
			
			String bo_seq;
			bo_seq = (String) client.queryForObject("proboard.upProboardSeq", proboardInfo);
			
			proboardInfo.setBo_seq(bo_seq);
			
			bo_no = (String) client.insert("proboard.insertProboardReply", proboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		
		return bo_no;
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("proboard.totalProboardCount", params);

	}

	@Override
	public List<ProBoardVO> proboardReplyList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("proboard.proboardReplyList", params);
	}

	@Override
	public void updateProboardReply(ProBoardVO proboardInfo) throws Exception {
		client.update("proboard.updateProboardReply", proboardInfo);
	}

}
