package wang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wang.dao.CompanyDao;
import wang.model.Company;

@Service
public class CompanyService {
	@Autowired
	CompanyDao companyDao;
	
	public int add(Company company){
		return companyDao.add(company);
	}
	
	public List<Company> getAllCompany(Company company){
		if(company==null){
			company=new Company();
			company.setType("");
		}
		return companyDao.getAllCompany(company);
	}
	
	public void delete(int id){
		companyDao.delete(id);
	}
	
	public Company getById(int id){
		return companyDao.getById(id);
	}
	
	public void update(Company company){
		companyDao.update(company);
	}
}
