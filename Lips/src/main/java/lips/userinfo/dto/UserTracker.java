package lips.userinfo.dto;

import java.util.Iterator;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

public class UserTracker {
	
	private int allUserTrack = 0;
	private int hasUserTrack = 0;
	private int hasAdminTrack = 0;
	
	@Override
	public String toString() {
		return "UserTrack [총 접속자 수=" + allUserTrack + ", 유저권한 접속자 수" + hasUserTrack + ", 관리자권한 접속자 수="
				+ hasAdminTrack + "]";
	}
	public int getAllUserTrack() {
		return allUserTrack;
	}
	public int getHasUserTrack() {
		return hasUserTrack;
	}
	public int getHasAdminTrack() {
		return hasAdminTrack;
	}
	public void setUserTrack(List<? extends GrantedAuthority> list,boolean login) {
		Iterator itr = list.iterator();
		if(login) {
			while(itr.hasNext()) {
				 String ga = ((GrantedAuthority)itr.next()).getAuthority();
				 if(ga.equals("USER")) {
					 loginUser();
				 }else if(ga.equals("ADMIN")) {
					 loginAdmin();
				 }
			}
		}else {//logout
			while(itr.hasNext()) {
				String ga = ((GrantedAuthority)itr.next()).getAuthority();
				 if(ga.equals("USER")) {
					 logoutUser();
				 }else if(ga.equals("ADMIN")) {
					 logoutAdmin();
				 }
			}
		}
	}
	private void loginUser() {
		allUserTrack++;
		hasUserTrack++;
	}
	private void logoutUser() {
		allUserTrack--;
		hasUserTrack--;
	}
	private void loginAdmin() {
		hasAdminTrack++;
	}
	private void logoutAdmin() {
		hasAdminTrack--;
	}
	
	
	
}
