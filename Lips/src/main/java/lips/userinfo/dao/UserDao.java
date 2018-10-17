package lips.userinfo.dao;

import lips.userinfo.dto.User;

public interface UserDao {

	/**
	 * @param selCookie_login
	 * @return User
	 * 쿠키값으로 찾은 아이디로 조회하여 유저객체를 반환한다.
	 */
	public User selUserById(String userId);

}
