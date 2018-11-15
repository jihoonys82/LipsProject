package lips.freeboard.dto;

import java.util.Date;

public class FComentDto {
	private int fcomentId;
	private int fboardId;
	private String fcomentWriter;
	private String fcoment;
	private Date fcomentday;
	
	@Override
	public String toString() {
		return "FComentDto [fcomentId=" + fcomentId + ", fboardId=" + fboardId + ", fcomentWriter=" + fcomentWriter
				+ ", fcoment=" + fcoment + ", fcomentday=" + fcomentday + "]";
	}

	public int getFcomentId() {
		return fcomentId;
	}

	public void setFcomentId(int fcomentId) {
		this.fcomentId = fcomentId;
	}

	public int getFboardId() {
		return fboardId;
	}

	public void setFboardId(int fboardId) {
		this.fboardId = fboardId;
	}

	public String getFcomentWriter() {
		return fcomentWriter;
	}

	public void setFcomentWriter(String fcomentWriter) {
		this.fcomentWriter = fcomentWriter;
	}

	public String getFcoment() {
		return fcoment;
	}

	public void setFcoment(String fcoment) {
		this.fcoment = fcoment;
	}

	public Date getFcomentday() {
		return fcomentday;
	}

	public void setFcomentday(Date fcomentday) {
		this.fcomentday = fcomentday;
	}
	
	

}
