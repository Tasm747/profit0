package com.ab.profit.form;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.ab.profit.entity.Course;


public class CourseForm 
{
	@Valid
	private List<Course> items = new ArrayList<>();
	
	public CourseForm() 
	{
		super();
	}

	public CourseForm(List<Course> items) 
	{
		super();
		this.items = items;
	}

	public List<Course> getItems() 
	{
		return items;
	}

	public void setItems(List<Course> items) 
	{
		this.items = items;
	}
}
