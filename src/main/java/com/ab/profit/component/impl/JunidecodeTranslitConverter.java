package com.ab.profit.component.impl;

import org.springframework.stereotype.Component;

import com.ab.profit.component.TranslitConverter;

import net.sf.junidecode.Junidecode;

// Konvertiert in ASCII

@Component
public class JunidecodeTranslitConverter implements TranslitConverter 
{

	@Override
	public String translit(String text) 
	{
		return Junidecode.unidecode(text);
	}
}
