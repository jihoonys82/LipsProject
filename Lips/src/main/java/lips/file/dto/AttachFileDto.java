package lips.file.dto;

import java.util.Date;

public class AttachFileDto {
	private int fileId;
	private String originName;
	private String storedName;
	private long fileSize;
	private Date uploadDate;
	private String userId;
	
	@Override
	public String toString() {
		return "AttachFileDto [fileId=" + fileId + ", originName=" + originName + ", storedName=" + storedName
				+ ", fileSize=" + fileSize + ", uploadDate=" + uploadDate + ", userId=" + userId + "]";
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
