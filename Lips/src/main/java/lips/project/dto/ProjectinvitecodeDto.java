package lips.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProjectinvitecodeDto {

	
	private int projectId;
	private String userId;
	private int userLevel;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date expiryDate;
	private String inviteCode;
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getInviteCode() {
		return inviteCode;
	}
	public void setInviteCode(String inviteCode) {
		this.inviteCode = inviteCode;
	}
	@Override
	public String toString() {
		return "ProjectinvitecodeDto [projectId=" + projectId + ", userId=" + userId + ", userLevel=" + userLevel
				+ ", expiryDate=" + expiryDate + ", inviteCode=" + inviteCode + "]";
	}
	
}
