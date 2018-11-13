package lips.card.dto;

import java.util.Date;

public class CardDto {
	//Dashboard_user_asset
	private int dashboardId;
	private int positionX;
	private int positionY;
	private String assetValue;
	private int projectId;
	

	//Dashboard_asset
	private int assetId;
	private String assetName;
	private String assetDescription;
	private String assetView;
	
	//ProjectDate
	private Date createDate;
	private Date closeDate;
	
	private String userId;
	
	@Override
	public String toString() {
		return "CardDto [dashboardId=" + dashboardId + ", positionX=" + positionX + ", positionY=" + positionY
				+ ", assetValue=" + assetValue + ", projectId=" + projectId + ", assetId=" + assetId + ", assetName="
				+ assetName + ", assetDescription=" + assetDescription + ", assetView=" + assetView + ", createDate="
				+ createDate + ", closeDate=" + closeDate + ", userId=" + userId + "]";
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
	
	public Date getCloseDate() {
		return closeDate;
	}
	
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public int getProjectId() {
		return projectId;
	}
	
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public int getDashboardId() {
		return dashboardId;
	}

	public void setDashboardId(int dashboardId) {
		this.dashboardId = dashboardId;
	}

	public int getPositionX() {
		return positionX;
	}

	public void setPositionX(int positionX) {
		this.positionX = positionX;
	}

	public int getPositionY() {
		return positionY;
	}

	public void setPositionY(int positionY) {
		this.positionY = positionY;
	}

	public String getAssetValue() {
		return assetValue;
	}

	public void setAssetValue(String assetValue) {
		this.assetValue = assetValue;
	}

	public int getAssetId() {
		return assetId;
	}

	public void setAssetId(int assetId) {
		this.assetId = assetId;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public String getAssetDescription() {
		return assetDescription;
	}

	public void setAssetDescription(String assetDescription) {
		this.assetDescription = assetDescription;
	}

	public String getAssetView() {
		return assetView;
	}

	public void setAssetView(String assetView) {
		this.assetView = assetView;
	}
	
}
	
	
	