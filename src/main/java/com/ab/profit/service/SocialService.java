package com.ab.profit.service;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.ab.profit.entity.Profile;

//Prozess zum bekommen von Objekten aus Social Network (Facebook)


public interface SocialService<T> 
{

	@Nullable Profile loginOrSignup(@Nonnull T model);
}
