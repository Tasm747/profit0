package com.ab.profit.service;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.ab.profit.entity.Profile;
import com.ab.profit.model.NotificationMessage;

public interface NotificationSenderService 
{

	void sendNotification(@Nonnull NotificationMessage message);

	@Nullable String getDestinationAddress(@Nonnull Profile profile);
}
