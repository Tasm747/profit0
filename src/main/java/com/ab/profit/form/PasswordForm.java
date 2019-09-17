package com.ab.profit.form;

import com.ab.profit.annotation.EnableFormErrorConvertation;
import com.ab.profit.annotation.constraints.FieldMatch;
import com.ab.profit.annotation.constraints.PasswordStrength;


@FieldMatch(first = "password", second = "confirmPassword", message = "The password fields must match")
@EnableFormErrorConvertation(formName="passwordForm", fieldReference="confirmPassword", validationAnnotationClass=FieldMatch.class)
public class PasswordForm 
{

	@PasswordStrength
	private String password;
	
	private String confirmPassword;
	
	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getConfirmPassword() 
	{
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) 
	{
		this.confirmPassword = confirmPassword;
	}
}
