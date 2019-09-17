package com.ab.profit.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.ab.profit.annotation.constraints.Phone;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;

//Für Phone validation wird benutzt google library i18n in src/main/resources/messages.properties

public class PhoneConstraintValidator implements ConstraintValidator<Phone, String> 
{
	@Override
	public void initialize(Phone constraintAnnotation) 
	{
		
	}

	@Override
	public boolean isValid(String rawNumber, ConstraintValidatorContext context) 
	{
		if(rawNumber == null) 
		{
			return true;
		}
		try 
		{
        	Phonenumber.PhoneNumber number = PhoneNumberUtil.getInstance().parse(rawNumber, "");
            return PhoneNumberUtil.getInstance().isValidNumber(number);
        } 
		catch (NumberParseException e) 
		{
            return false;
        }
	}
}
