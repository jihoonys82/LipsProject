package lips.issue.dto;

public class IssueStagePresetAssetDto {
	private int issuePresetId;
	private int stageAssetId;
	private int assetOrder;
	
	@Override
	public String toString() {
		return "IssueStagePresetAssetDto [issuePresetId=" + issuePresetId + ", stageAssetId=" + stageAssetId
				+ ", assetOrder=" + assetOrder + "]";
	}

	public int getIssuePresetId() {
		return issuePresetId;
	}

	public void setIssuePresetId(int issuePresetId) {
		this.issuePresetId = issuePresetId;
	}

	public int getStageAssetId() {
		return stageAssetId;
	}

	public void setStageAssetId(int stageAssetId) {
		this.stageAssetId = stageAssetId;
	}

	public int getAssetOrder() {
		return assetOrder;
	}

	public void setAssetOrder(int assetOrder) {
		this.assetOrder = assetOrder;
	}
}
