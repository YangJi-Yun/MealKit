package com.shop.ex.dto;

public class QnADTO {
	private int no;
	private String mId;
	private String id;
	private String productId;
	private int categories;
	private String title;
	private String contents;
	private int hit;
	private String wtime;
	private String answer;
	private int groupNum;
	private int stepNum;
	private String qnaKind;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getCategories() {
		return categories;
	}
	public void setCategories(int categories) {
		this.categories = categories;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getWtime() {
		return wtime;
	}
	public void setWtime(String wtime) {
		this.wtime = wtime;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String anwser) {
		this.answer = anwser;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getStepNum() {
		return stepNum;
	}
	public void setStepNum(int stepNum) {
		this.stepNum = stepNum;
	}
	public String getQnaKind() {              
		return qnaKind;                       
    }                                         
	public void setQnaKind(String qnaKind) {  	
    	this.qnaKind = qnaKind;               
    }                                         
}
