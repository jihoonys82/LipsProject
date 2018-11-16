package lips.alarm.dto;

import java.util.Date;

public class Alarm {
	private String userId;
	private String issueId;
	private Date lastReq;
	private String content;
	private String title;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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