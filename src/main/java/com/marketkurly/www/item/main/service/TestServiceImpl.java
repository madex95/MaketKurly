package com.marketkurly.www.item.main.service;

import java.util.List;
import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.marketkurly.www.item.main.mapper.TestMapper;
 
@Service
public class TestServiceImpl implements TestService{
 
    @Autowired
    TestMapper testtableMapper;
    
    @Override
    public List<Map<String, Object>> SelectAllList() throws Exception {
        // TODO Auto-generated method stub
        return testtableMapper.SelectAllList();
    }
 
}
