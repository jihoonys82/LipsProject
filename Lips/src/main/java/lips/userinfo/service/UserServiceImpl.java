package lips.userinfo.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;
	@Override
	public User login(User user) {
		return userDao.selUserByIdPw(user);
	}

	
	@Override
	public User loginAuto(String sessionId) {
		User user =userDao.selIdBySId(sessionId);
		if(user!=null)  return userDao.selUserById(user);
		return null;
	}

	@Override
	public void join(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User update(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addLoginServer(User user, String sessionId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("user", user);
		map.put("sessionId", sessionId);
		if(userDao.selLoginCntByUId(user.getUserId())==0) {
			userDao.inUserLoginServer(map);
		}else {
			userDao.upUserLoginServer(map);
		}
		
	}

	@Override
	public int checkLoginServer(String sessionId) {
		return userDao.selLoginCntBySId(sessionId);
	}

}
