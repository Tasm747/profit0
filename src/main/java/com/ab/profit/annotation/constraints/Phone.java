package com.ab.profit.annotation.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.ab.profit.validator.PhoneConstraintValidator;

//Annotation Phone. 
//Alle Annotation in diesem package haben zusammenhang mit package "com.ab.profit.validator"

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { PhoneConstraintValidator.class })
public @interface Phone 
{

	String message() default "Phone";
	
	Class<? extends Payload>[] payload() default { };
	
	Class<?>[] groups() default { };
}
