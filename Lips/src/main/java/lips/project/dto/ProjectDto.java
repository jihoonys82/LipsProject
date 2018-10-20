package lips.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProjectDto {

	private int projectId;
	private String projectName;
	private String projectKey;
	private int projectOpen;
	private String projectCreater;
	private String projectLeader;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date closeDate;
	private String status;
	private String projectDesc;
	//프로젝트 메인페이지 조회용
	private String UserId;
	
	//프로젝트 초대코드
	private String invitecode;

	@Override
	public String toString() {
		return "ProjectDto [projectId=" + projectId + ", projectName=" + projectName + ", projectKey=" + projectKey
				+ ", projectOpen=" + projectOpen + ", projectCreater=" + projectCreater + ", projectLeader="
				+ projectLeader + ", createDate=" + createDate + ", closeDate=" + closeDate + ", status=" + status
				+ ", projectDesc=" + projectDesc + ", UserId=" + UserId + ", invitecode=" + invitecode + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
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

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getInvitecode() {
		return invitecode;
	}

	public void setInvitecode(String invitecode) {
		this.invitecode = invitecode;
	}
	
}