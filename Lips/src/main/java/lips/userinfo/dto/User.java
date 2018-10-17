package lips.userinfo.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{
	private String userId;
	private String email;
	private String pw;
	private Date createDate;
	private String nick;
	private int blocked;
	private int userLevel;
	private String phone;
	private Date birth;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getBlocked() {
		return blocked;
	}
	public void setBlocked(int blocked) {
		this.blocked = blocked;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("USER"));
		if (userId != null && userLevel  > 1) {
			authorities.add(new SimpleGrantedAuthority("ADMIN"));
		}
		return authorities;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", pw=" + pw + ", createDate=" + createDate + ", nick="
				+ nick + ", blocked=" + blocked + ", userLevel=" + userLevel + ", phone=" + phone + ", birth=" + birth
				+ "]";
	}
	@Override
	public String getPassword() {
		return pw;
	}
	@Override
	public String getUsername() {
		return userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	

}
