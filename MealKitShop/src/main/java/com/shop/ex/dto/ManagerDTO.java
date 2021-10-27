package com.shop.ex.dto;

public class ManagerDTO {
	private String id;
	private String mId;
	private String mPw;
	private String mName;
	private String mEmail;
	private String mCellphone;
	private int verify;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmCellphone() {
		return mCellphone;
	}
	public void setmCellphone(String mCellphone) {
		this.mCellphone = mCellphone;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
}
