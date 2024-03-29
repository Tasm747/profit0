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

import com.ab.profit.validator.AdulthoodConstraintValidator;

//Annotation Alter

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { AdulthoodConstraintValidator.class })
public @interface Adulthood 
{

	String message() default "Adulthood";
	
	int adulthoodAge() default 18;
	
	Class<? extends Payload>[] payload() default { };
	
	Class<?>[] groups() default { };
}
