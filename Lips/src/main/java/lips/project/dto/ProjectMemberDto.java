package lips.project.dto;

public class ProjectMemberDto {

	private int projectId;
	private String userId;
	private int userLevel;
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
	@Override
	public String toString() {
		return "ProjectMemeberDto [projectId=" + projectId + ", userId=" + userId + ", userLevel=" + userLevel + "]";
	}
}
