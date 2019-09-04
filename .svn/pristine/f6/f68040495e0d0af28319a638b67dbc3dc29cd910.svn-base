package kr.or.ddit.errAi.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.AIErrVO;
import kr.or.ddit.vo.ErrboardVO;

@Repository
public class IErrAIDaoImpl implements IErrAIDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<AIErrVO> findErrSol(Map<String, String> params)
			throws Exception {
		return this.client.queryForList("obi.findErrSol", params);
	}

	@Override
	public String insErr(ErrboardVO errInfo) throws Exception {
		String err_no = null;
		
		 try{
	         client.startTransaction();
	         err_no = (String) client.insert("obi.insErr", errInfo);
	         client.commitTransaction();
	      }finally {
	    	  
	         client.endTransaction();
	      }
		return err_no;
	}
	
	

}
