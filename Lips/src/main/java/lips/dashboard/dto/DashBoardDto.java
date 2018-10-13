package lips.dashboard.dto;

public class DashBoardDto {

	private int dashboardId;
	private int projectId;
	private String userId;
	private String dashboardName;
	
	public int getDashboardId() {
		return dashboardId;
	}

	public void setDashboardId(int dashboardId) {
		this.dashboardId = dashboardId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getUserid() {
		return userId;
	}

	public void setUserid(String userid) {
		this.userId = userid;
	}

	public String getDashboardName() {
		return dashboardName;
	}

	public void setDashboardName(String dashboardName) {
		this.dashboardName = dashboardName;
	}

	@Override
	public String toString() {
		return "DashBoardDto [dashboardId=" + dashboardId + ", projectId=" + projectId + ", userId=" + userId
				+ ", dashboardName=" + dashboardName + "]";
	}
	
}
