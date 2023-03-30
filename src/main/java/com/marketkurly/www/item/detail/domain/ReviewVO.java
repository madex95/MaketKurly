package com.marketkurly.www.item.detail.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

public class ReviewVO {
	
private String review_itemcode;
private String review_id;
private int review_grade;
@DateTimeFormat(pattern="yyyy-MM-dd")
private Date review_date;
private String review_content;

@Override
public String toString() {
	return "ReviewVO [review_itemcode=" + review_itemcode + ", review_id=" + review_id + ", review_grade="
			+ review_grade + ", review_date=" + review_date + ", review_content=" + review_content + "]";
}
public String getReview_itemcode() {
	return review_itemcode;
}
public void setReview_itemcode(String review_itemcode) {
	this.review_itemcode = review_itemcode;
}
public String getReview_id() {
	return review_id;
}
public void setReview_id(String review_id) {
	this.review_id = review_id;
}
public int getReview_grade() {
	return review_grade;
}
public void setReview_grade(int review_grade) {
	this.review_grade = review_grade;
}
public Date getReview_date() {
	return review_date;
}
public void setReview_date(Date review_date) {
	this.review_date = review_date;
}
public String getReview_content() {
	return review_content;
}
public void setReview_content(String review_content) {
	this.review_content = review_content;
}


}
