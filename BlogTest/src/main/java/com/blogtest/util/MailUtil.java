package com.blogtest.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.blogtest.dto.EmailDTO;

@Component
public class MailUtil {
	@Autowired
	protected JavaMailSender mailSender;
	
	@Scheduled(fixedDelay=5000) //5초의 타임아웃 시간설정//
	public void SendEmail(EmailDTO emaildto) throws Exception {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(emaildto.getReciver());
        message.setFrom("scw0531@naver.com");
        message.setSubject("Blog test mail");
        message.setText(emaildto.getContent());
        
        mailSender.send(message);
    }
}
