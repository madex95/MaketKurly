package com.marketkurly.www.common.user.myPage.myReview.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyReviewVO {
	private String review_itemcode;
	private String review_id;
	private String review_grade;
	private String review_content;
	private Date review_date;
	private String item_name;
	private String item_image;
	private Date ori_date;
}
