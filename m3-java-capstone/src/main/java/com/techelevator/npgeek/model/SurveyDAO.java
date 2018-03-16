package com.techelevator.npgeek.model;

import java.util.List;
import java.util.Map;

public interface SurveyDAO {

	public List<Survey> getAllSurveyResults();
	public void save(Survey survey);
	Map<String, Integer> getDisplayInformation();
	
}