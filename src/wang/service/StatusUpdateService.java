package wang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import wang.dao.StatusUpdateDao;
import wang.model.StatusUpdate;
@Component
public class StatusUpdateService {
	@Autowired
	StatusUpdateDao statusUpdateDao;
	
	public List<StatusUpdate> getStatusByRecordId(int id){
		return statusUpdateDao.getStatusByRecordId(id);
	}
	
	public StatusUpdate getLatestStatusByRecordId(int id){
		return statusUpdateDao.getLatestStatusByRecordId(id);
	}
	
	public int add(StatusUpdate statusUpdate){
		return statusUpdateDao.add(statusUpdate);
	}
}
