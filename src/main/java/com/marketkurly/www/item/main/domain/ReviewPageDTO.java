package com.marketkurly.www.item.main.domain;

import java.util.List;

import lombok.Data;
@Data
public class ReviewPageDTO {
	
	List<ReviewVO> list;
	
	PageDTO pageinfo;


}
