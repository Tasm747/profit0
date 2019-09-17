package com.ab.profit.service;

import javax.annotation.Nonnull;

import com.ab.profit.entity.Profile;

//Schickt Messages zu Benutzer

public interface NotificationManagerService 
{

	void sendRestoreAccessLink(@Nonnull Profile profile, @Nonnull String restoreLink);

	void sendPasswordChanged(@Nonnull Profile profile);
	
	void sendPasswordGenerated(@Nonnull Profile profile, @Nonnull String generatedPassword);
}
