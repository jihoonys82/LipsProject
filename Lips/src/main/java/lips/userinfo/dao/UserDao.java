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
	/**
	 * 알람 서버 
	 * @param user
	 */
	public void inUserAlarm(User user);
	/**
	 * 아이디 중복확인
	 * @param user
	 * @return int
	 */
	public int selCntUserId(User user);
	/**
	 * 이메일 중복확인
	 * @param user
	 * @return int
	 */
	public int selCntUserEmail(User user);
	/**
	 * 유저 정보 변경
	 * @param user
	 */
	public void upUserData(User user);
	
	/**
	 * Deactivate User (회원 탈퇴)
	 * @param user
	 */
	public void upUserDeactivate(User user);
	
	/**
	 * Get Crypted Password (패스워드 값 조회)
	 * @param user
	 * @return
	 */
	public String selPasswordByUser(User user);
}
