package com.ab.profit.repository.search;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import com.ab.profit.entity.Profile;


public interface ProfileSearchRepository extends ElasticsearchRepository<Profile, Long> 
{

	/**
	 * 
	 * http://docs.spring.io/spring-data/elasticsearch/docs/current/reference/html/#elasticsearch.query-methods.criterions
	 */
	Page<Profile> findByObjectiveLikeOrSummaryLikeOrInfoLikeOrCertificatesNameLikeOrLanguagesNameLikeOrPracticsCompanyLikeOrPracticsPositionLikeOrPracticsResponsibilitiesLikeOrSkillsValueLike(
			String objective, String info, String summary, String certificateName, String languageName, String practicCompany, 
			String practicPosition, String practicResponsibility, String skillValue, Pageable pageable);
	
}
