package com.ab.profit.component;

import java.lang.annotation.Annotation;

import javax.annotation.Nonnull;

import org.springframework.validation.BindingResult;

//Konvertiert Form Fehler
public interface FormErrorConverter 
{

	void convertFormErrorToFieldError(@Nonnull Class<? extends Annotation> validationAnnotationClass, @Nonnull Object formInstance, @Nonnull BindingResult bindingResult);
}
