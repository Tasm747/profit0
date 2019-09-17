package com.ab.profit.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Nonnull;

import com.ab.profit.entity.Hobby;
import com.ab.profit.model.LanguageLevel;
import com.ab.profit.model.LanguageType;


//Statische Daten (Hobbies)

public interface StaticDataService 
{

	@Nonnull Set<Hobby> listAllHobbies();
	
	@Nonnull List<Hobby> createHobbyEntitiesByNames(@Nonnull List<String> names);
	
	@Nonnull Map<Integer, String> mapMonths();
	
	@Nonnull List<Integer> listPracticsYears();
	
	@Nonnull List<Integer> listCourcesYears();
	
	@Nonnull List<Integer> listEducationYears();
	
	@Nonnull Collection<LanguageType> getAllLanguageTypes(); 
	
	@Nonnull Collection<LanguageLevel> getAllLanguageLevels();
}
