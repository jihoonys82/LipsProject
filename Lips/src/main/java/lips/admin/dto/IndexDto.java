package lips.admin.dto;

public class IndexDto {
	private String startdate ;
	private String enddate;
	private String combodata;
	private String inputValue;
	
	private int startNo;	//게시물리스트 첫 번호
	private int endNo;	//게시물리스트 마지막 번호
	
	
	
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
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getCombodata() {
		return combodata;
	}
	public void setCombodata(String combodata) {
		this.combodata = combodata;
	}
	public String getInputValue() {
		return inputValue;
	}
	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}
	
	
	@Override
	public String toString() {
		return "IndexDto [startdate=" + startdate + ", enddate=" + enddate + ", combodata=" + combodata
				+ ", inputValue=" + inputValue + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}
	
	

}
