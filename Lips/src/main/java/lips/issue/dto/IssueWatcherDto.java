package lips.issue.dto;

public class IssueWatcherDto {

	private int issueId;
	private String userId;
	
	@Override
	public String toString() {
		return "IssueWatcherDto [issueId=" + issueId + ", userId=" + userId + "]";
	}

	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
