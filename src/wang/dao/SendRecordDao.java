package wang.dao;

import java.util.List;

import wang.model.SearchParams;
import wang.model.SendRecord;

import com.ebaoyang.dao.MyBatisRepository;

@MyBatisRepository
public interface SendRecordDao {
	
	public int add(SendRecord sendRecord);
	
	public void delete(int id);
	
	public void update(SendRecord sendRecord);
	
	public List<SendRecord> getAll(int userid);
	
	public SendRecord getById(int id);
	
	public List<SendRecord> getAllByParams(int userid,int start,int limit);
	
	public List<SendRecord> getAllBySearchParams(int userid,SearchParams searchParams,int start,int limit);
	
	public int getCountBySearchParams(int userid,SearchParams searchParams);
	
	
}
