package com.ab.profit.configuration;

import java.io.IOException;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;


@Configuration
@ComponentScan({ "com.ab.profit.service.impl", "com.ab.profit.component.impl" })
@EnableAspectJAutoProxy
public class ServiceConfig 
{
	
	@Bean
	public PropertiesFactoryBean properties()
	{
		PropertiesFactoryBean properties = new PropertiesFactoryBean();
		properties.setLocations(new ClassPathResource("logic.properties"));
		return properties;
	}
	
	/**
	 * http://docs.spring.io/autorepo/docs/spring/4.2.5.RELEASE/spring-framework-reference/html/beans.html
	 * 
	 * Also, be particularly careful with BeanPostProcessor and BeanFactoryPostProcessor definitions via @Bean. 
	 * Those should usually be declared as static @Bean methods, not triggering the instantiation of their containing configuration class. 
	 * Otherwise, @Autowired and @Value won�t work on the configuration class itself since it is being created as a bean instance too early.
	 */
	@Bean
	public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() throws IOException 
	{
		PropertySourcesPlaceholderConfigurer conf = new PropertySourcesPlaceholderConfigurer();
		conf.setLocations(new ClassPathResource("logic.properties"), new ClassPathResource("properties/application.properties"), new ClassPathResource("properties/elasticsearch.properties"));
		return conf;
	}
}
