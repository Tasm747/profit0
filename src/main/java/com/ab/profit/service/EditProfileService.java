package com.ab.profit.service;

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.springframework.web.multipart.MultipartFile;

import com.ab.profit.entity.Certificate;
import com.ab.profit.entity.Contacts;
import com.ab.profit.entity.Course;
import com.ab.profit.entity.Education;
import com.ab.profit.entity.Hobby;
import com.ab.profit.entity.Language;
import com.ab.profit.entity.Practic;
import com.ab.profit.entity.Profile;
import com.ab.profit.entity.Skill;
import com.ab.profit.entity.SkillCategory;
import com.ab.profit.form.InfoForm;
import com.ab.profit.form.PasswordForm;
import com.ab.profit.form.SignUpForm;
import com.ab.profit.model.CurrentProfile;

//Wichtige services für die ganze Application

public interface EditProfileService 
{

	@Nullable Profile findProfileById(@Nonnull CurrentProfile currentProfile);
	
	@Nonnull Contacts findContactsById(@Nonnull CurrentProfile currentProfile);

	@Nonnull Profile createNewProfile(@Nonnull SignUpForm signUpForm);

	void removeProfile(@Nonnull CurrentProfile currentProfile);

	@Nonnull Profile updateProfilePassword(@Nonnull CurrentProfile currentProfile, @Nonnull PasswordForm form);

	void updateProfileData(@Nonnull CurrentProfile currentProfile, @Nonnull Profile data, @Nonnull MultipartFile uploadPhoto);

	void updateContacts(@Nonnull CurrentProfile currentProfile, @Nonnull Contacts data);
	
	void updateInfo(@Nonnull CurrentProfile currentProfile, @Nonnull InfoForm form);

	@Nonnull List<Hobby> listHobbiesWithProfileSelected(@Nonnull CurrentProfile currentProfile);

	void updateHobbies(@Nonnull CurrentProfile currentProfile, @Nonnull List<String> hobbies);

	@Nonnull List<Language> listLanguages(@Nonnull CurrentProfile currentProfile);

	void updateLanguages(@Nonnull CurrentProfile currentProfile, @Nonnull List<Language> languages);

	@Nonnull List<Skill> listSkills(@Nonnull CurrentProfile currentProfile);

	@Nonnull List<SkillCategory> listSkillCategories();

	void updateSkills(@Nonnull CurrentProfile currentProfile, @Nonnull List<Skill> skills);

	@Nonnull List<Practic> listPractics(@Nonnull CurrentProfile currentProfile);

	void updatePractics(@Nonnull CurrentProfile currentProfile, @Nonnull List<Practic> practics);

	@Nonnull List<Education> listEducations(@Nonnull CurrentProfile currentProfile);

	void updateEducations(@Nonnull CurrentProfile currentProfile, @Nonnull List<Education> educations);

	@Nonnull List<Certificate> listCertificates(@Nonnull CurrentProfile currentProfile);
	
	void updateCertificates(@Nonnull CurrentProfile currentProfile, @Nonnull List<Certificate> certificates);
	
	@Nonnull List<Course> listCourses(@Nonnull CurrentProfile currentProfile);
	
	void updateCourses(@Nonnull CurrentProfile currentProfile, @Nonnull List<Course> courses);
}
