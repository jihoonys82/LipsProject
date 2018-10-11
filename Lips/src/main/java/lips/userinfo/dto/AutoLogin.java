package lips.userinfo.dto;

import java.util.Date;

public class AutoLogin {
	private String userId;
	private String sessionId;
	private Date lastRequest;
	private String lastActivity;
	private String connectedIp;
	
	@Override
	public String toString() {
		return "UserCookie [userId=" + userId + ", sessionId=" + sessionId + ", lastRequest=" + lastRequest
				+ ", lastActivity=" + lastActivity + ", connectedIp=" + connectedIp + "]";
	}
	
	public String getUserid() {
		return userId;
	}
	public void setUserid(String userid) {
		this.userId = userid;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Date getLastrequest() {
		return lastRequest;
	}
	public void setLastrequest(Date lastrequest) {
		this.lastRequest = lastrequest;
	}
	public String getLastactivity() {
		return lastActivity;
	}
	public void setLastactivity(String lastactivity) {
		this.lastActivity = lastactivity;
	}
	public String getConnectedIp() {
		return connectedIp;
	}
	public void setConnectedIp(String connectedIp) {
		this.connectedIp = connectedIp;
	}
}
