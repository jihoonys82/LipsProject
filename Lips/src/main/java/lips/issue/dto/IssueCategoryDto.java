package lips.issue.dto;

public class IssueCategoryDto {
	private int projectId;
	private int categoryAssetId;
	private int categoryOrder;
	
	@Override
	public String toString() {
		return "IssueCategoryDto [projectId=" + projectId + ", categoryAssetId=" + categoryAssetId + ", categoryOrder="
				+ categoryOrder + "]";
	}
	
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getCategoryAssetId() {
		return categoryAssetId;
	}
	public void setCategoryAssetId(int categoryAssetId) {
		this.categoryAssetId = categoryAssetId;
	}
	public int getCategoryOrder() {
		return categoryOrder;
	}
	public void setCategoryOrder(int categoryOrder) {
		this.categoryOrder = categoryOrder;
	}
}
