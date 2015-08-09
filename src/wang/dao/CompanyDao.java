package wang.dao;

import java.util.List;

import wang.model.Company;

import com.ebaoyang.dao.MyBatisRepository;

@MyBatisRepository
public interface CompanyDao {
	
	public int add(Company company);
	
	public List<Company> getAllCompany(Company company);
	
	public void delete(int id);
	
	public Company getById(int id);
	
	public void update(Company company);
	
}
