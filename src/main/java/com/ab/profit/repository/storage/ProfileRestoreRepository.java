package com.ab.profit.repository.storage;

import org.springframework.data.repository.CrudRepository;

import com.ab.profit.entity.ProfileRestore;


public interface ProfileRestoreRepository extends CrudRepository<ProfileRestore, Long> 
{
	
	ProfileRestore findByToken(String token);
}
