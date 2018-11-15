package lips.freeboard.dto;

import java.util.Date;

public class FreeboardDto {
	private int fboardId;
	private String fboardTitle;
	private String fboardWriter;
	private String fboardContent;
	private Date fboardWriteday;
	private int readcnt;
	private int startNo;
	private int endNo;
	
	
	@Override
	public String toString() {
		return "FreeboardDto [fboardId=" + fboardId + ", fboardTitle=" + fboardTitle + ", fboardWriter=" + fboardWriter
				+ ", fboardContent=" + fboardContent + ", fboardWriteday=" + fboardWriteday + ", readcnt=" + readcnt
				+ ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}


	public int getFboardId() {
		return fboardId;
	}

	public void setFboardId(int fboardId) {
		this.fboardId = fboardId;
	}

	public String getFboardTitle() {
		return fboardTitle;
	}

	public void setFboardTitle(String fboardTitle) {
		this.fboardTitle = fboardTitle;
	}

	public String getFboardWriter() {
		return fboardWriter;
	}

	public void setFboardWriter(String fboardWriter) {
		this.fboardWriter = fboardWriter;
	}

	public String getFboardContent() {
		return fboardContent;
	}

	public void setFboardContent(String fboardContent) {
		this.fboardContent = fboardContent;
	}

	public Date getFboardWriteday() {
		return fboardWriteday;
	}

	public void setFboardWriteday(Date fboardWriteday) {
		this.fboardWriteday = fboardWriteday;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	
	
}