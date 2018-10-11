package lips.userinfo.dto;

import java.util.Date;

public class User {
	private String userId;
	private String email;
	private String pw;
	private Date createDate;
	private String nick;
	private int blocked;
	private int userLevel;
	private String phone;
	private Date birth;
	
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", email=" + email + ", pw=" + pw + ", createDate=" + createDate + ", nick="
				+ nick + ", blocked=" + blocked + ", userLevel=" + userLevel + ", phone=" + phone + ", birth=" + birth
				+ "]";
	}
	
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

	
}
