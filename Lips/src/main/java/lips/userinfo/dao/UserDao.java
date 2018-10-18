package lips.userinfo.dao;

import lips.userinfo.dto.User;

public interface UserDao {

	/**
	 * 아이디로 유저 확인
	 * @param userId
	 * @return User
	 */
	public User selUserById(String userId);
	/**
	 * 이메일로 유저 확인
	 * @param email
	 * @return User
	 */
	public User selUserByEmail(String email);
	/**
	 * 회원가입
	 * @param user
	 */
	public void inUser(User user);

}
