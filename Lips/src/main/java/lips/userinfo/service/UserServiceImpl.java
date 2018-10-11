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
		return userDao.selectUserByIdAndPw(user);
	}

	@Override
	public User loginAuto(String sessionId) {
		 return userDao.selectUserById(userDao.selectUserIdBySessionId(sessionId));
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
		if(userDao.selectLoginServerCntByUserId(user.getUserId())==0) {
			userDao.insertUserDataBySessionId(map);
		}else {
			userDao.updateUserDataBySessionId(map);
		}
		
	}

}
