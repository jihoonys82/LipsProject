package lips.issue.dto;

public class CategoryAssetDto {
	private int categoryAssetId;
	private String assetName;
	private String assetCode;
	private String assetDescription;
	
	@Override
	public String toString() {
		return "CategoryAssetDto [categoryAssetId=" + categoryAssetId + ", assetName=" + assetName + ", assetCode="
				+ assetCode + ", assetDescription=" + assetDescription + "]";
	}

	public int getCategoryAssetId() {
		return categoryAssetId;
	}

	public void setCategoryAssetId(int categoryAssetId) {
		this.categoryAssetId = categoryAssetId;
	}

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public String getAssetCode() {
		return assetCode;
	}

	public void setAssetCode(String assetCode) {
		this.assetCode = assetCode;
	}

	public String getAssetDescription() {
		return assetDescription;
	}

	public void setAssetDescription(String assetDescription) {
		this.assetDescription = assetDescription;
	}
}
