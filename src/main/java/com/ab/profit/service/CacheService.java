package com.ab.profit.service;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.ab.profit.entity.Profile;

//Für laden von Benutzer aus dem DB
public interface CacheService 
{

	@Nullable Profile findProfileByUid(@Nonnull String uid);
	
	void deleteProfileByUid(@Nonnull String uid);
}
