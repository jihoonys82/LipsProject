package lips.card.dto;

public class CardDto {
	//Dashboard_user_asset
	private int dashboardId;
	private int positionX;
	private int positionY;
	private String assetValue;
	
	//Dashboard_asset
	private int assetId;
	private String assetName;
	private String assetDescription;
	private String assetView;
	
	@Override
	public String toString() {
		return "CardDto [dashboardId=" + dashboardId + ", positionX=" + positionX + ", positionY=" + positionY
				+ ", assetValue=" + assetValue + ", assetId=" + assetId + ", assetName=" + assetName
				+ ", assetDescription=" + assetDescription + ", assetView=" + assetView + "]";
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
	
	
	