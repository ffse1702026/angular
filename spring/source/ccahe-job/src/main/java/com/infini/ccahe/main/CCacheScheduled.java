package com.infini.ccahe.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.infini.ccahe.service.CCacheService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class CCacheScheduled {
	private static final Logger logger = LoggerFactory.getLogger(CCacheScheduled.class);
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

	@Autowired
	private CCacheService ccacheService;

	@Scheduled(cron = "0 * * * * ?")
	public void scheduleWithCron() {
		logger.info("-----------------------------------------------------------------------------------------");
		logger.info("Cron Task :: Execution Started Time - {}", dateTimeFormatter.format(LocalDateTime.now()));
		
		try {
			ccacheService.executeWithMultiThread();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("Cron Task :: Execution Finished Time - {}", dateTimeFormatter.format(LocalDateTime.now()));
		logger.info("-----------------------------------------------------------------------------------------");
	}
}
