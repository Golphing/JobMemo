package wang.dao;

import java.util.List;

import com.ebaoyang.dao.MyBatisRepository;

import wang.model.StatusUpdate;
@MyBatisRepository
public interface StatusUpdateDao {
	
	public List<StatusUpdate> getStatusByRecordId(int id);
	
	public StatusUpdate getLatestStatusByRecordId(int id);
	
	public int add(StatusUpdate statusUpdate);
}
