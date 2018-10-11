package lips.userinfo.dao;

import java.util.HashMap;

import lips.userinfo.dto.User;

public interface UserDao {
	public User selectUserByIdAndPw(User user);
	public User selectUserById(User user);
	public User selectUserIdBySessionId(String sessionId);
	public int selectLoginServerCntByUserId(String sessionId);
	public void insertUserDataBySessionId(HashMap<String,Object> map);
	public void updateUserDataBySessionId(HashMap<String,Object> map);
}
