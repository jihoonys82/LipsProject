package lips.admin.dto;

import java.util.Date;

public class NoticeDto {
	
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date createDate;
	private int noticeCategory;
	private int hit;
	private String userId;
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getNoticeCategory() {
		return noticeCategory;
	}
	public void setNoticeCategory(int noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "NoticeDto [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", createDate=" + createDate + ", noticeCategory=" + noticeCategory + ", hit=" + hit + ", userId="
				+ userId + "]";
	}
	
}
