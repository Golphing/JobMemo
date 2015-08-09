package wang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import wang.dao.SendRecordDao;
import wang.model.SearchParams;
import wang.model.SendRecord;
@Component
public class SendRecordService {
	@Autowired
	SendRecordDao sendRecordDao;
	
	public int add(SendRecord sendRecord){
		return sendRecordDao.add(sendRecord);
	}
	
	public void delete(int id){
		sendRecordDao.delete(id);
	}
	
	public void update(SendRecord sendRecord){
		sendRecordDao.update(sendRecord);
	}
	
	public List<SendRecord> getAll(int userId){
		
		return sendRecordDao.getAll(userId);
	}
	
	public SendRecord getById(int id){
		return sendRecordDao.getById(id);
	}
	
	public List<SendRecord> getAllByParams(int userid,int start,int limit){
		return sendRecordDao.getAllByParams(userid, start, limit);
	}
	
	public List<SendRecord> getAllBySearchParams(int userid,SearchParams searchParams,int start,int limit){
		return sendRecordDao.getAllBySearchParams(userid, searchParams, start, limit);
	}
	
	public int getCountBySearchParams(int userid,SearchParams searchParams){
		return sendRecordDao.getCountBySearchParams(userid, searchParams);
	}
	
}
