package lips.userinfo.dao;

import java.util.HashMap;

import lips.userinfo.dto.User;

public interface UserDao {
	
	/**
	 * @param inputData_login
	 * @return User
	 * 입력데이터를 검증하여 유저객체를 반환한다.
	 */
	public User selUserByIdPw(User user);
	/**
	 * @param selCookie_login
	 * @return User
	 * 쿠키값으로 찾은 아이디로 조회하여 유저객체를 반환한다.
	 */
	public User selUserById(String userId);
	/**
	 * @param sessionId_cookie
	 * @return User
	 * 쿠키값을 조회하여 아이디를 반환한다.
	 */
	public User selIdBySId(String sessionId);
	/**
	 * @param sessionId_cookie
	 * @return int
	 * 로그인서버에 세션정보와 아이디가 존재하는지 확인한다.
	 */
	public int selLoginCntBySId(String sessionId);
	/**
	 * @param userId
	 * @return int
	 * 로그인서버에 세션정보와 아이디가 존재하는지 확인한다.
	 */
	public int selLoginCntByUId(String userId);
	
	/**
	 * @param map
	 * 로그인서버에 유저정보를 추가한다.
	 */
	public void inUserLoginServer(HashMap<String,Object> map);
	/**
	 * @param map
	 * 로그인서버에 유저정보를 갱신한다.
	 */
	public void upUserLoginServer(HashMap<String,Object> map);
	
	/**
	 *  
	 * @return int
	 * 접속중인 유저수를 반환한다.
	 */
	public int selActiveUserCnt();
}
