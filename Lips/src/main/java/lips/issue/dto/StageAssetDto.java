package lips.issue.dto;

public class StageAssetDto {
	private int stageAssetId;
	private String stageName;
	private String assetDescription;
	
	@Override
	public String toString() {
		return "StageAssetDto [stageAssetId=" + stageAssetId + ", stageName=" + stageName + ", assetDescription="
				+ assetDescription + "]";
	}
	
	public int getStageAssetId() {
		return stageAssetId;
	}
	public void setStageAssetId(int stageAssetId) {
		this.stageAssetId = stageAssetId;
	}
	public String getStageName() {
		return stageName;
	}
	public void setStageName(String stageName) {
		this.stageName = stageName;
	}
	public String getAssetDescription() {
		return assetDescription;
	}
	public void setAssetDescription(String assetDescription) {
		this.assetDescription = assetDescription;
	}
	
	
}
