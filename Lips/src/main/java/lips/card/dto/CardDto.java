package lips.card.dto;

public class CardDto {
	private int dashboardId;
	private int positionX;
	private int positionY;
	private String assetValue;
	private String assetView;
	

	@Override
	public String toString() {
		return "CardDto [dashboardId=" + dashboardId + ", positionX=" + positionX + ", positionY=" + positionY
				+ ", assetValue=" + assetValue + ", assetView=" + assetView + "]";
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


	public String getAssetView() {
		return assetView;
	}


	public void setAssetView(String assetView) {
		this.assetView = assetView;
	}
	
}
