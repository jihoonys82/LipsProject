package lips.issue.dto;

import java.util.Date;

public class IssueDto {
	private int issueId;
	private int projectId;
	private String issueTitle;
	private int categoryId;
	private String createUser;
	private String assignee;
	private Date createDate;
	private Date modifyDate;
	private Date startDate;
	private Date expectedEndDate;
	private Date actualEndDate;
	private String issueContent;
	private String customValues;
	private int issueStage;
	private int stagePresetId;
	
	@Override
	public String toString() {
		return "IssueDto [issueId=" + issueId + ", projectId=" + projectId + ", issueTitle=" + issueTitle
				+ ", categoryId=" + categoryId + ", createUser=" + createUser + ", assignee=" + assignee
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", startDate=" + startDate
				+ ", expectedEndDate=" + expectedEndDate + ", actualEndDate=" + actualEndDate + ", issueContent="
				+ issueContent + ", customValues=" + customValues + ", issueStage=" + issueStage + ", stagePresetId="
				+ stagePresetId + "]";
	}

	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getIssueTitle() {
		return issueTitle;
	}

	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getExpectedEndDate() {
		return expectedEndDate;
	}

	public void setExpectedEndDate(Date expectedEndDate) {
		this.expectedEndDate = expectedEndDate;
	}

	public Date getActualEndDate() {
		return actualEndDate;
	}

	public void setActualEndDate(Date actualEndDate) {
		this.actualEndDate = actualEndDate;
	}

	public String getIssueContent() {
		return issueContent;
	}

	public void setIssueContent(String issueContent) {
		this.issueContent = issueContent;
	}

	public String getCustomValues() {
		return customValues;
	}

	public void setCustomValues(String customValues) {
		this.customValues = customValues;
	}

	public int getIssueStage() {
		return issueStage;
	}

	public void setIssueStage(int issueStage) {
		this.issueStage = issueStage;
	}

	public int getStagePresetId() {
		return stagePresetId;
	}

	public void setStagePresetId(int stagePresetId) {
		this.stagePresetId = stagePresetId;
	}
}
