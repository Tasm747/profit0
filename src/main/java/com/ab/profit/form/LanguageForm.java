package com.ab.profit.form;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.ab.profit.entity.Language;


public class LanguageForm 
{
	@Valid
	private List<Language> items = new ArrayList<>();
	
	public LanguageForm() 
	{
		super();
	}

	public LanguageForm(List<Language> items) 
	{
		super();
		this.items = items;
	}

	public List<Language> getItems() 
	{
		return items;
	}

	public void setItems(List<Language> items) 
	{
		this.items = items;
	}
}
