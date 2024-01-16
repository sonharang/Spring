package com.yedam.app.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Component;

public class SpringMainClass {
	public static void main(String[] args) {
		System.out.println("Spring 방식");
		ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext.xml");
		TV tv = (TV)ctx.getBean("tv");
		//TV tv = (TV)ctx.getBean(TV.class); @Component() 안에 "tv" 안넣을때 방법
		tv.on();
	}

}
