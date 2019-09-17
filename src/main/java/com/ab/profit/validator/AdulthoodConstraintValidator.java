package com.ab.profit.validator;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.joda.time.DateTime;

import com.ab.profit.annotation.constraints.Adulthood;


public class AdulthoodConstraintValidator implements ConstraintValidator<Adulthood, Date> 
{
	private int adulthoodAge;
	@Override
	public void initialize(Adulthood constraintAnnotation) 
	{
		this.adulthoodAge = constraintAnnotation.adulthoodAge();
	}

	@Override
	public boolean isValid(Date value, ConstraintValidatorContext context) 
	{
		if(value == null) 
		{
			return true;
		} 
		else
		{
			DateTime critical = DateTime.now().minusYears(adulthoodAge);
			return value.before(critical.toDate());
		}
	}
}
