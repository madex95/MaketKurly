package com.marketkurly.www.item.main.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.marketkurly.www.item.main.mapper.WelcomeWebMapper;
import com.marketkurly.www.common.user.domain.UserVO;
import com.marketkurly.www.item.main.domain.Criteria;
import com.marketkurly.www.item.main.domain.ItemVO;

@Service
public class WelcomeWebServiceImpl implements WelcomeWebService {
	@Autowired
	 WelcomeWebMapper wlecomewebmapper;
	@Override
	public List <ItemVO> selectWelcomeWebServiceList()  {
		// TODO Auto-generated method stub
		return wlecomewebmapper.selectWelcomeWebServiceList();
	}
	@Override
	public List<ItemVO> cateitemlist(String item_cgcode, Criteria cri) {
		// TODO Auto-generated method stub
		return wlecomewebmapper.cateitemlist(item_cgcode, cri );
	}
	@Override
	public ItemVO detailpage(String item_code) {
		// TODO Auto-generated method stub
		return wlecomewebmapper.detailpage(item_code);
	}
	@Override
	public List<ItemVO> search(String item_name) {
		// TODO Auto-generated method stub
		return  wlecomewebmapper.search(item_name);
	}
	@Override
	public String grant() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

		String nowId = "";
		if (principal != null) {
			nowId = auth.getName();
		}
		return wlecomewebmapper.grant(nowId);
	}

}
