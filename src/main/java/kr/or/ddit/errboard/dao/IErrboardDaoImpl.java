package kr.or.ddit.errboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.ErrboardVO;

@Repository
public class IErrboardDaoImpl implements IErrboardDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public ErrboardVO errboardInfo(Map<String, String> params) throws Exception {
		return (ErrboardVO) client.queryForObject("errboard.errboardInfo",params);
	}

	@Override
	public List<ErrboardVO> errboardList(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("errboard.errboardList", params);
	}
	
	@Override
	public String insertErrBoardInfo(ErrboardVO errboardInfo) throws Exception {
		String err_no="";
		try {
			client.startTransaction();
			err_no = (String) client.insert("errboard.insertErrboard", errboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return err_no;
	}

	@Override
	public void updateErrBoardInfo(ErrboardVO errboardInfo) throws Exception {
		client.update("errboard.updateErrboard", errboardInfo);
	}

	@Override
	public void deleteErrBoardInfo(Map<String, String> params) throws Exception {
		client.update("errboard.deleteErrboard", params);
		
	}

	@Override
	public int totalCount(Map<String, String> params) throws Exception {
		return (int) client.queryForObject("errboard.totalErrboardCount", params);

	}
	@Override
	public void updateErrBoardInfo_end(ErrboardVO errboardInfo)
			throws Exception {
		client.update("errboard.updateErrboard_end", errboardInfo);
	}

	@Override
	public String insertSchedule(ErrboardVO errboardInfo) throws Exception {
		String err_no="";
		try {
			client.startTransaction();
			err_no = (String) client.insert("errboard.insertSchedule1", errboardInfo);
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
		return err_no;
	}

}
