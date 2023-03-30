package com.marketkurly.www.item.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.marketkurly.www.item.main.mapper.CateMapper;
import com.marketkurly.www.item.main.domain.CateVO;
import com.marketkurly.www.item.main.domain.Criteria;

@Service
@Primary
public class CateServiceImpl implements CateService {

	@Autowired
	CateMapper catemapper;
	@Override
	public List<CateVO> getCateCode1(Criteria cri) {
	
		return catemapper.getCateCode1(cri) ;
	}

}
