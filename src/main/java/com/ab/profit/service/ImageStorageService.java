package com.ab.profit.service;

import java.nio.file.Path;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.ab.profit.Constants.UIImageType;

//Prozess zu Datenspeicherung

public interface ImageStorageService 
{
	
	@Nonnull String saveAndReturnImageLink (@Nonnull String imageName, @Nonnull UIImageType imageType, @Nonnull Path tempImageFile);

	void remove (@Nullable String ... imageLinks);
}
