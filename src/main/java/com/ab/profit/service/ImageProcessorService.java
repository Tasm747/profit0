package com.ab.profit.service;

import javax.annotation.Nonnull;

import org.springframework.web.multipart.MultipartFile;

import com.ab.profit.model.UploadCertificateResult;
import com.ab.profit.model.UploadResult;

//prozess zu ausgeben von Images

public interface ImageProcessorService 
{

	@Nonnull UploadResult processNewProfilePhoto(@Nonnull MultipartFile uploadPhoto);

	@Nonnull UploadCertificateResult processNewCertificateImage(@Nonnull MultipartFile uploadCertificateImage);
}
