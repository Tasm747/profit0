package com.ab.profit.service.impl;

import static com.ab.profit.Constants.UIImageType.AVATARS;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationAdapter;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.multipart.MultipartFile;

import com.ab.profit.component.TranslitConverter;
import com.ab.profit.entity.Profile;
import com.ab.profit.exception.CantCompleteClientRequestException;
import com.ab.profit.model.UploadResult;
import com.ab.profit.service.ImageProcessorService;
import com.ab.profit.service.NotificationManagerService;
import com.ab.profit.service.SocialService;
import com.ab.profit.util.DataUtil;
import com.restfb.types.User;

@Service
public class FacebookSocialService extends AbstractCreateProfileService implements SocialService<User> {

	@Value("${generate.password.alphabet}")
	private String generatePasswordAlphabet;

	@Value("${generate.password.length}")
	private int generatePasswordLength;

	@Autowired
	private TranslitConverter translitConverter;

	@Autowired
	private ImageProcessorService imageProcessorService;

	@Autowired
	private NotificationManagerService notificationManagerService;

	@Override
	@Transactional
	public Profile loginOrSignup(User model) 
	{
		if (StringUtils.isNotBlank(model.getEmail())) 
		{
			Profile p = profileRepository.findByEmail(model.getEmail());
			if (p != null) 
			{
				LOGGER.debug("Found profile by email={} for login via facebook request", model.getEmail());
				return p;
			}
		}
		return createNewProfile(model);
	}

	protected Profile createNewProfile(User model) 
	{
		String firstName = translitConverter.translit(model.getFirstName());
		String lastName = translitConverter.translit(model.getLastName());
		String generatedPassword = DataUtil.generateRandomString(generatePasswordAlphabet, generatePasswordLength);
		Profile profile = createNewProfile(firstName, lastName, generatedPassword);
		profile.setEmail(model.getEmail());
		extractBirthDay(model, profile);
		extractCityAndCountry(model, profile);
		extractAccountAvatar(model, profile);
		profileRepository.save(profile);
		sendPasswordGeneratedIfTransactionSuccess(profile, generatedPassword);
		return profile;
	}

	protected void extractBirthDay(User model, Profile profile) 
	{
		Date birthDay = model.getBirthdayAsDate();
		if (birthDay != null) 
		{
			profile.setBirthDay(new java.sql.Date(birthDay.getTime()));
		}
	}

	protected void extractCityAndCountry(User model, Profile profile) 
	{
		String location = model.getLocation().getName();
		if (StringUtils.isNotBlank(location))
		{
			String[] data = location.split(",");
			if (data.length > 1) 
			{
				profile.setCity(data[0].trim());
				profile.setCountry(data[1].trim());
			} 
			else 
			{
				profile.setCity(data[0].trim());
			}
		} 
		else 
		{
			profile.setCity(model.getHometownName());
		}
	}

	protected void extractAccountAvatar(User model, Profile profile) 
	{
		try 
		{
			String link = String.format("https://graph.facebook.com/%s/picture?width=%s&height=%s", model.getId(), AVATARS.getLargeWidth(), AVATARS.getLargeHeight());
			LOGGER.debug("Extract avatar link: {}", link);
			UploadResult uploadResult = imageProcessorService.processNewProfilePhoto(new MultipartFromUrl(link));
			profile.updateProfilePhotos(uploadResult.getLargeUrl(), uploadResult.getSmallUrl());
		}
		catch (CantCompleteClientRequestException e) 
		{
			LOGGER.warn("Can't extract account avatar: " + e.getMessage(), e);
		}
	}

	protected void sendPasswordGeneratedIfTransactionSuccess(final Profile profile, final String generatedPassword) 
	{
		TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronizationAdapter() 
		{
			@Override
			public void afterCommit() 
			{
				LOGGER.info("New profile created from facebook: {}", profile.getUid());
				notificationManagerService.sendPasswordGenerated(profile, generatedPassword);
			}
		});
	}

	
	protected static class MultipartFromUrl implements MultipartFile 
	{
		protected final String link;

		public MultipartFromUrl(String link) 
		{
			super();
			this.link = link;
		}

		@Override
		public String getName() 
		{
			return link;
		}

		@Override
		public String getOriginalFilename() 
		{
			return link;
		}

		@Override
		public String getContentType() 
		{
			return "image/jpeg";
		}

		@Override
		public boolean isEmpty() 
		{
			return false;
		}

		@Override
		public long getSize() 
		{
			throw new UnsupportedOperationException();
		}

		@Override
		public byte[] getBytes() throws IOException 
		{
			throw new UnsupportedOperationException();
		}

		@Override
		public InputStream getInputStream() throws IOException 
		{
			throw new UnsupportedOperationException();
		}

		@Override
		public void transferTo(File dest) throws IOException, IllegalStateException 
		{
			HttpURLConnection conn = null;
			try 
			{
				conn = (HttpURLConnection) new URL(link).openConnection();
				try (InputStream in = conn.getInputStream()) 
				{
					Files.copy(in, Paths.get(dest.getAbsolutePath()), StandardCopyOption.REPLACE_EXISTING);
				}
			} 
			finally 
			{
				if (conn != null) 
				{
					conn.disconnect();
				}
			}
		}
	}
}
