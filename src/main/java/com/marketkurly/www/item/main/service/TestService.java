package com.marketkurly.www.item.main.service;


import java.util.List;
import java.util.Map;

public interface TestService {
   
   //select * from Test_Table
   public List<Map<String, Object>> SelectAllList() throws Exception;
}
