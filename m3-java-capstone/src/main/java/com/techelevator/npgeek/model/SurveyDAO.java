package com.techelevator.npgeek.model;

import java.util.List;

public interface SurveyDAO {

	public List<Survey> getAllSurveyResults();
	public void save(Survey survey);
	
}