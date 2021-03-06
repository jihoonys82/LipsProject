package lips.issue.dto;

public class IssueStagePresetDto {
	private int issuePresetId;
	private String presetName;
	private String userId;
	private int projectId;
	
	@Override
	public String toString() {
		return "IssueStagePresetDto [issuePresetId=" + issuePresetId + ", presetName=" + presetName + ", userId="
				+ userId + ", projectId=" + projectId + "]";
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getIssuePresetId() {
		return issuePresetId;
	}
	public void setIssuePresetId(int issuePresetId) {
		this.issuePresetId = issuePresetId;
	}
	public String getPresetName() {
		return presetName;
	}
	public void setPresetName(String presetName) {
		this.presetName = presetName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
