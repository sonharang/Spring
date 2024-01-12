package com.yedam.app.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("tv")
public class SamsungTV implements TV {
	
	/* @Autowired */ 
	Speaker speaker;
	
	/* @Autowired  생성자나 세터 어디에 위치해도 상관없음*/ 
	SamsungTV(Speaker speaker) {
		this.speaker = speaker;
	}
	SamsungTV() {} //기본 생성자 명시 위의 생성자 주석처리하면 지워도 됨
	
	@Autowired
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}
	
	@Override
	public void on() {
		System.out.println("삼성 TV를 켰다.");
		speaker.on();
	}
}
