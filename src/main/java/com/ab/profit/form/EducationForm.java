package com.ab.profit.form;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.ab.profit.entity.Education;


public class EducationForm 
{
	@Valid
	private List<Education> items = new ArrayList<>();
	
	public EducationForm() 
	{
		super();
	}

	public EducationForm(List<Education> items) 
	{
		super();
		this.items = items;
	}

	public List<Education> getItems() 
	{
		return items;
	}

	public void setItems(List<Education> items) 
	{
		this.items = items;
	}
}
