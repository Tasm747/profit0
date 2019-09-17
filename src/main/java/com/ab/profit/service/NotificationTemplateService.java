package com.ab.profit.service;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.ab.profit.model.NotificationMessage;

public interface NotificationTemplateService 
{

	@Nonnull NotificationMessage createNotificationMessage (@Nonnull String templateName, @Nullable Object model);
}
