package lips.issue.dto;

public class IssueAttachFileDto {

	private int issueId;
	private int fileId;
	@Override
	public String toString() {
		return "IssueAttachFileDto [issueId=" + issueId + ", fileId=" + fileId + "]";
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
}
