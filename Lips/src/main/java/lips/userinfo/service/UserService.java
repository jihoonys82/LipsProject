package lips.userinfo.service;

import lips.userinfo.dto.User;

public interface UserService {

	public User login(User user);
	public User loginAuto(String sessionId);
	public void join(User user);
	public User update(User user);
	public void addLoginServer(User user, String sessionId);
	
}
