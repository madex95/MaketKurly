package com.marketkurly.www.common.user.register.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PhoneService {
	public Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCSNPDATPK23XDQ9";
	    String api_secret = "XVZJOC5MJQRPBOD8WUKA7AWTETG5COR8";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01087388534");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
		logger.info("폰인증 실시2 받아온 폰넘버 = " + phone);
		logger.info("폰인증 실시2 받아온 랜덤넘버 = " + randomNumber);
		logger.info("폰인증 실시3 받아온 키 = " + api_key);
		logger.info("폰인증 실시3 생성된 시크릿 = " + api_secret);

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
}
