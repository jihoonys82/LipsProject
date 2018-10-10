package lips.userinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;
	@Override
	public User login(User user) {
		return userDao.selectUserByIdAndPw(user);
	}

	@Override
	public User loginAuto(String sessionId) {
		return userDao.selectUserBySessionId(sessionId);
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

}
