package lips.userinfo.dao;

import lips.userinfo.dto.User;

public interface UserDao {
	public User selectUserByIdAndPw(User user);
	public User selectUserBySessionId(String sessionId);
}
