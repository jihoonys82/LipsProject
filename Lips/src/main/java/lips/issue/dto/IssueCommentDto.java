package lips.issue.dto;

import java.util.Date;

public class IssueCommentDto {
	private int commentId;
	private int issueId;
	private String userId;
	private Date createDate;
	private String commentContent;
	private int attachFile;
	
	@Override
	public String toString() {
		return "IssueCommentDto [commentId=" + commentId + ", issueId=" + issueId + ", userId=" + userId
				+ ", createDate=" + createDate + ", commentContent=" + commentContent + ", attachFile=" + attachFile
				+ "]";
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getAttachFile() {
		return attachFile;
	}

	public void setAttachFile(int attachFile) {
		this.attachFile = attachFile;
	}
}
