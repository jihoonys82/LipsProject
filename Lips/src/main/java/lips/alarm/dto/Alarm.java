package lips.alarm.dto;

import java.util.Date;

public class Alarm {
	private String userId;
	private String issueId;
	private Date lastReq;
	private String content;
	
	public String getIssueId() {
		return issueId;
	}
	public void setIssueId(String issueId) {
		this.issueId = issueId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getLastRequest() {
		return lastReq;
	}
	public void setLastRequest(Date lastReq) {
		this.lastReq = lastReq;
	}
	@Override
	public String toString() {
		return "Alarm [userId=" + userId + ", lastRequest=" + lastReq + ", content=" + content + "]";
	}
}