package com.marketkurly.www.common.center.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMarker {
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	 private int totalCount;
	 private int startPage;
	 private int endPage;
	 private int realStart;
	 private int realEnd;
	 private boolean prev;
	 private boolean next;
	 private int displayPageNum = 10;


	 private Criteria cri;

	 
	 public void setCri(Criteria cri) {
	  this.cri = cri;
	 }

	 public void setTotalCount(int totalCount) {
	  this.totalCount = totalCount;
	  calcData();
	 }

	 public int getTotalCount() {
	  return totalCount;
	 }

	 public int getStartPage() {
	  return startPage;
	 }

	 
	 public int getEndPage() {
	  return endPage;
	 }
	 
	 public int getRealStart() {
		  return realStart;
		 }

	 public int getRealEnd() {
		  return realEnd;
		 }

	 public boolean isPrev() {
	  return prev;
	 }

	 public boolean isNext() {
	  return next;
	 }

	 public int getDisplayPageNum() {
	  return displayPageNum;
	 }

	 public Criteria getCri() {
	  return cri;
	 }
	 
	 private void calcData() {
	  endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
	  startPage = (endPage - displayPageNum) + 1;
	  realStart = 1;
	  
	  if(totalCount<=10) {
		  realEnd = 1;
	  } else if(totalCount%10==0) {
		  realEnd=totalCount/10;
	  } else if (totalCount%10!=0) {
		  realEnd=(totalCount/10)+1;
	  }
	  
	  logger.info("페이지 테스트 " +totalCount);
	  
	  int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
	  if (endPage > tempEndPage)
	  {
	   endPage = tempEndPage;
	  }
	  prev = startPage == 1 ? false : true;
	  next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	 }
	 
	 public String makeQuery(int page)
	 {
	  UriComponents uriComponents =
	    UriComponentsBuilder.newInstance()
	    .queryParam("page", page)
	    .queryParam("perPageNum", cri.getPerPageNum())
	    .build();
	    
	  return uriComponents.toUriString();
	 }
	 
}
