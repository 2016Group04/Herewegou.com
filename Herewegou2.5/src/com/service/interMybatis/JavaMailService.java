package com.service.interMybatis;

public interface JavaMailService {

	public boolean sendTextMail(String from,String to,String subject,String content);
}
