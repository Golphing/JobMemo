package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import wang.model.SendRecord;
import wang.service.SendRecordService;

public class SpringTest {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext-core.xml");
		SendRecord send=new SendRecord();
		send.setCompanyName("alibaba");
		send.setProcess("offer");
		SendRecordService service=(SendRecordService)context.getBean(SendRecordService.class);
		service.add(send);
		System.out.println("end");
		
	}
}
