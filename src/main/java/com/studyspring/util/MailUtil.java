package com.studyspring.util;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {
	//자바메일 패키지//
	
	@Scheduled(fixedDelay=5000) //5초의 타임아웃 시간설정//
	public void transMail() {
		System.out.println("mail trans...");
	}
}
