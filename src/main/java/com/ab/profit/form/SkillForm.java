package com.ab.profit.form;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.ab.profit.entity.Skill;


public class SkillForm 
{
	@Valid
	private List<Skill> items = new ArrayList<>();
	
	public SkillForm() 
	{
		super();
	}

	public SkillForm(List<Skill> items) 
	{
		super();
		this.items = items;
	}

	public List<Skill> getItems() 
	{
		return items;
	}

	public void setItems(List<Skill> items) 
	{
		this.items = items;
	}
}
