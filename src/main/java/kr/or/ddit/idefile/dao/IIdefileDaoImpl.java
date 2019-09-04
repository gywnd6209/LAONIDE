package kr.or.ddit.idefile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IdeFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IIdefileDaoImpl implements IIdefileDao {
	@Autowired
	private SqlMapClient client;
	
	@Override
	public IdeFileVO idefileInfo(Map<String, String> params)
			throws Exception {
		// TODO Auto-generated method stub
		return (IdeFileVO) this.client.queryForObject("idefile.idefileInfo", params);
	}

	@Override
	public String insertIdefileInfo(IdeFileVO idefileInfo)
			throws SQLException {
		String file_no = "";
        try {
           client.startTransaction();

           file_no = (String) client.insert("idefile.insertIdefile",idefileInfo);
           
           client.commitTransaction();
        } finally {
           client.endTransaction();
        }
        return file_no;
	}

//	@Override
//	public void updateIdefileInfo(IdeFileVO idefileInfo)
//			throws SQLException {
//		client.update("idefile.updateIdefile",idefileInfo);
//	}
//
//	@Override
//	public void deleteIdefileInfo(Map<String, String> params)
//			throws SQLException {
//		client.update("recruitboard.deleteIdefileInfo", params);
//	}
}
