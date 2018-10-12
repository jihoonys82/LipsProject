package lips.project.dto;

import java.util.Date;

public class ProjectDto {

	private int projectId;
	private String projectName;
	private String projectKey;
	private int projectOpen;
	private String projectCreater;
	private String projectLeader;
	private String createDate;
	private String closeDate;
	private String status;
	private String projectDesc;
	@Override
	public String toString() {
		return "ProjectDto [projectId=" + projectId + ", projectName=" + projectName + ", projectKey=" + projectKey
				+ ", projectOpen=" + projectOpen + ", projectCreater=" + projectCreater + ", projectLeader="
				+ projectLeader + ", createDate=" + createDate + ", closeDate=" + closeDate + ", status=" + status
				+ ", projectDesc=" + projectDesc + "]";
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectKey() {
		return projectKey;
	}
	public void setProjectKey(String projectKey) {
		this.projectKey = projectKey;
	}
	public int getProjectOpen() {
		return projectOpen;
	}
	public void setProjectOpen(int projectOpen) {
		this.projectOpen = projectOpen;
	}
	public String getProjectCreater() {
		return projectCreater;
	}
	public void setProjectCreater(String projectCreater) {
		this.projectCreater = projectCreater;
	}
	public String getProjectLeader() {
		return projectLeader;
	}
	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProjectDesc() {
		return projectDesc;
	}
	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}
	
	
}