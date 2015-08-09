package wang.dao;

import com.ebaoyang.dao.MyBatisRepository;

import wang.model.User;
@MyBatisRepository
public interface UserDao {
	
	public int add(User user);
	
	public User get(String name,String password);
	
	public int count1();
}
