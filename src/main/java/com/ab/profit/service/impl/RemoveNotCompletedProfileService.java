package com.ab.profit.service.impl;

import java.sql.Timestamp;

import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ab.profit.repository.storage.ProfileRepository;


@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RemoveNotCompletedProfileService {
	private static final Logger LOGGER = LoggerFactory.getLogger(RemoveNotCompletedProfileService.class);
	@Autowired
	private ProfileRepository profileRepository;

	@Value("${remove.not.completed.profiles.interval}")
	private int removeNotCompletedProfilesInterval;

	@Transactional
	@Scheduled(cron = "0 59 23 * * *")
	public void removeNotCompletedProfiles() 
	{
		DateTime date = DateTime.now().minusDays(removeNotCompletedProfilesInterval);
		int removed = profileRepository.deleteNotCompleted(new Timestamp(date.getMillis()));
		LOGGER.info("Removed {} profiles", removed);
	}
}
