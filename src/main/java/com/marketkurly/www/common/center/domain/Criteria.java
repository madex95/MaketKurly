package com.marketkurly.www.common.center.domain;

public class Criteria {
	 private int page;
	 private int perPageNum;
	 private int rowStart;
	 private int rowEnd;
	 
	 private String board_part;
	 private String board_id;
	 private String review_id;
	 private int reply_num;
	 
	 public Criteria()
	 {
	  this.page = 1;
	  this.perPageNum = 10;
	 }

	 public void setPage(int page)
	 {
	  if (page <= 0)
	  {
	   this.page = 1;
	   return;
	  }
	  this.page = page;
	 }

	 public void setPerPageNum(int perPageNum)
	 {
	  if (perPageNum <= 0 || perPageNum > 100)
	  {
	   this.perPageNum = 10;
	   return;
	  }
	  this.perPageNum = perPageNum;
	 }

	 public int getPage()
	 {
	  return page;
	 }

	 public int getPageStart()
	 {
	  return (this.page - 1) * perPageNum;
	 }

	 public int getPerPageNum()
	 {
	  return this.perPageNum;
	 }

	 @Override
	 public String toString() {
	  return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ""
	    + ", rowStart=" +  getRowStart() + ", rowEnd=" + getRowEnd()
	    + "]";
	 }

	 public int getRowStart() {
	  rowStart = ((page - 1) * perPageNum) + 1;
	  return rowStart;
	 }

	 public int getRowEnd() {
	  rowEnd = rowStart + perPageNum - 1;
	  return rowEnd;
	 }

	public String getBoard_part() {
		return board_part;
	}

	public void setBoard_part(String board_part) {
		this.board_part = board_part;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
}
